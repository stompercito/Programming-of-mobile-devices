
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
  });

  static ProductList loadList(){
    List<ProductCart> cartList = [];
    return ProductList(
      drinksLista: ProductRepository.loadProducts(ProductType.BEBIDAS),
      grainsLista: ProductRepository.loadProducts(ProductType.GRANO),
      cupsLista: ProductRepository.loadProducts(ProductType.TAZAS),
      cartLista: cartList,
      
    );
  }

  static setCart(ProductList p, List<ProductCart> pro){
    return ProductList(
      drinksLista: p.drinksLista,
      grainsLista: p.grainsLista,
      cupsLista: p.cupsLista,
      cartLista: pro,
      cart: p.cart,
      cups: p.cups,
      drinks: p.drinks,
      grains: p.grains,

    );
  }

  static setCartList(ProductList p, List<ProductCart> temp, ProductCart pro){
    //Hacer logica para saber si se añade o no un elemento. Tomar como dato extra el objeto para saber las condicionales de carrito.
    temp.add(pro);
    return setCart(p, temp);
  }

  static setCup(ProductList p, ProductCups cups){
    return ProductList(
      drinksLista: p.drinksLista,
      grainsLista: p.grainsLista,
      cupsLista: p.cupsLista,
      cartLista: p.cartLista,
      cart: p.cart,
      cups: ProductCups.setCup(cups),
      drinks: p.drinks,
      grains: p.grains,
    );
  }
  

  static setDrink(ProductList p, ProductDrinks drink){
    return ProductList(
      drinksLista: p.drinksLista,
      grainsLista: p.grainsLista,
      cupsLista: p.cupsLista,
      cartLista: p.cartLista,
      cart: p.cart,
      cups: p.cups,
      drinks: ProductDrinks.setDrink(drink),
      grains: p.grains,
    );
  }

  static setGrain(ProductList p, ProductGrains grain){
    return ProductList(
      drinksLista: p.drinksLista,
      grainsLista: p.grainsLista,
      cupsLista: p.cupsLista,
      cartLista: p.cartLista,
      cart: p.cart,
      cups: p.cups,
      drinks: p.drinks,
      grains: ProductGrains.setGrain(grain),
    );
  }

}