import 'dart:math';
import 'package:flutter/foundation.dart';

enum ProductColor { WHITE, ORANGE, BLUE }

class ProductCups {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductColor productColor; // color del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked; //Si el producto tiene like
  bool cartWhite; //Si el blanco ya esta en el carrito
  bool cartOrange; //Si el naranja ya esta en el carrito
  bool cartBlue; //Si el azul ya esta en el carrito

  ProductCups({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
    this.cartWhite = false,
    this.cartOrange = false,
    this.cartBlue = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  static setCup(ProductCups cups){
    return ProductCups(
      productTitle: cups.productTitle,
      productDescription: cups.productDescription,
      productImage: cups.productImage,
      productColor: cups.productColor,
      productAmount: cups.productAmount,
      liked: cups.liked,
      cartWhite: cups.cartWhite,
      cartOrange: cups.cartOrange,
      cartBlue: cups.cartBlue,
    );
  }

  double productPriceCalculator() {
    if (this.productColor == ProductColor.WHITE)
      return (135.toDouble());
    if (this.productColor == ProductColor.ORANGE)
      return (145 .toDouble());
    if (this.productColor == ProductColor.BLUE)
      return (175.toDouble());
    return 9999.0;
  }
}
