import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/colors.dart';

class DrinksPage extends StatelessWidget {
  ProductList products;
  DrinksPage({
    Key key,
    @required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas', style: TextStyle(color: coffeBlanco),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.of(context).pop(products);
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async{ 
            await Navigator.of(context).push(        
              MaterialPageRoute(builder: (context) => Cart(producto: products),
              ),
            ).then((updateProducts) {
              products = updateProducts;
            });
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.drinksLista.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDrinks(
            drink: products.drinksLista[index],
            producto: products,
          );
        },
      ),
    );
  }
}
