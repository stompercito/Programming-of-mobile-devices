
import 'package:flutter/foundation.dart';

enum ProductSize { CH, M, G }

class ProductDrinks {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductSize productSize; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked; //Si el producto tiene like
  bool cartCH; //Si el chico ya esta en el carrito
  bool cartM; //Si el mediano ya esta en el carrito
  bool cartG; //Si el grande ya esta en el carrito


  ProductDrinks({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSize,
    @required this.productAmount,
    this.liked = false,
    this.cartCH = false,
    this.cartM = false,
    this.cartG = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }

 static setDrink(ProductDrinks drink){
    return ProductDrinks(
      productTitle: drink.productTitle,
      productDescription: drink.productDescription,
      productImage: drink.productImage,
      productSize: drink.productSize,
      productAmount: drink.productAmount,
      liked: drink.liked,
      cartCH: drink.cartCH,
      cartM: drink.cartM,
      cartG: drink.cartG,
    );
  }

  double productPriceCalculator() {
    if (this.productSize == ProductSize.CH)
      return (20.toDouble());
    if (this.productSize == ProductSize.M)
      return (40.toDouble());
    if (this.productSize == ProductSize.G)
      return (60.toDouble());
    return 999.0;
  }
}
