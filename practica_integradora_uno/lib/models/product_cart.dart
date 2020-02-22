import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

class ProductCart {
  String productTitle;
  int productAmount;
  double productPrice;
  ProductType typeOfProduct;
  String productImage; // url de imagen del producto
  bool liked; //Si el producto tiene like

  ProductCart({
    this.liked = false,
    this.typeOfProduct,
    @required this.productImage,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
  });

  static setCart(ProductCart cart){
    return ProductCart(
      liked: cart.liked,
      productImage: cart.productImage,
      typeOfProduct: cart.typeOfProduct,
      productTitle: cart.productTitle,
      productAmount: cart.productAmount,
      productPrice: cart.productPrice,
    );
  }

  static addToCart(String pT, int pA, double pP, ProductType pTy, String i, bool li){
    return ProductCart(
      liked: li,
      typeOfProduct: pTy,
      productTitle: pT,
      productAmount: pA,
      productPrice: pP,
      productImage: i,
    );
  }
  
}