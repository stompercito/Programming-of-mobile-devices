import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/productos/accesorios/item_accesorios.dart';
import 'package:proyecto_zimmca/models/listOfProducts.dart';
import 'package:proyecto_zimmca/cart/cart.dart';
import 'package:proyecto_zimmca/user/profile.dart';
import 'package:proyecto_zimmca/utils/colors.dart';

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
