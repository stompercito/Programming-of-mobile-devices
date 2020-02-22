import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

import 'package:practica_integradora_uno/models/product_drinks.dart';

import 'package:practica_integradora_uno/models/product_cups.dart';

import 'package:practica_integradora_uno/models/product_grains.dart';

import 'package:practica_integradora_uno/models/product_cart.dart';


class ProductList {
  List<ProductDrinks> drinksLista;
  List<ProductGrains> grainsLista;
  List<ProductCups> cupsLista;
  List<ProductCart> cartLista;
  ProductCart cart;
  ProductCups cups;
  ProductDrinks drinks;
  ProductGrains grains;


  ProductList({
    this.drinksLista,
    this.grainsLista,
    this.cupsLista,
    this.cartLista,
    this.cart,
    this.cups,
    this.drinks,
    this.grains,
  }){
    
  }

  static ProductList loadList(){
    return ProductList(
      drinksLista: ProductRepository.loadProducts(ProductType.BEBIDAS),
      grainsLista: ProductRepository.loadProducts(ProductType.GRANO),
      cupsLista: ProductRepository.loadProducts(ProductType.TAZAS)
    );
  }

  static setCart(List<ProductCart> pro){
    return ProductList(
     cartLista: pro,
     /*cups: ProductCups.setCup(pro.cups),
     drinks: ProductDrinks.setDrink(pro.drinks),
     grains: ProductGrains.setGrain(pro.grains),*/

    );
  }

  static setCup(ProductCups cups){
    return ProductList(
      cups: ProductCups.setCup(cups)
    );
  }
  

  static setDrink(ProductDrinks drink){
    return ProductList(
      drinks: ProductDrinks.setDrink(drink)
    );
  }

  static setGrain(ProductGrains grain){
    return ProductList(
      grains: ProductGrains.setGrain(grain)
    );
  }

}