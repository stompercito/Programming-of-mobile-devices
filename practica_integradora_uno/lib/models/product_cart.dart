import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

class ProductCart {
  String productTitle;
  int productAmount;
  double productPrice;
  ProductType typeOfProduct;

  ProductCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
  });

  static setCart(ProductCart cart){
    return ProductCart(
      typeOfProduct: cart.typeOfProduct,
      productTitle: cart.productTitle,
      productAmount: cart.productAmount,
      productPrice: cart.productPrice,
    );
  }

  static addToCart(String pT, int pA, double pP, ProductType pTy){
    return ProductCart(
      typeOfProduct: pTy,
      productTitle: pT,
      productAmount: pA,
      productPrice: pP,
    );
  }
  
}