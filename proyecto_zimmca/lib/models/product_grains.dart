
import 'package:flutter/foundation.dart';

enum ProductWeight { CUARTO, KILO }

class ProductGrains {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductWeight productWeight; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked; //Si el producto tiene like
  bool cartCuarto; //Si el cuarto ya esta en el carrito
  bool cartKilo; //Si el kilo ya esta en el carrito

  ProductGrains({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productWeight,
    @required this.productAmount,
    this.liked = false,
    this.cartCuarto = false,
    this.cartKilo = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  static setGrain(ProductGrains grain){
    return ProductGrains(
      productTitle: grain.productTitle,
      productDescription: grain.productDescription,
      productImage: grain.productImage,
      productWeight: grain.productWeight,
      productAmount: grain.productAmount,
      liked: grain.liked,
      cartCuarto: grain.cartCuarto,
      cartKilo: grain.cartKilo,
    );
  }

  double productPriceCalculator() {
    if (this.productWeight == ProductWeight.CUARTO)
      return (245.toDouble());
    if (this.productWeight == ProductWeight.KILO)
      return (525.toDouble());
    return 9999.0;
  }
}
