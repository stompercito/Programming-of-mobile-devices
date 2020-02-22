import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/cups/cups_page.dart';
import 'package:practica_integradora_uno/grains/grains_page.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/colors.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductList products = ProductList.loadList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: coffeBlanco),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _openCartPage,
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
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Café de grano",
              image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          GestureDetector(
            onTap: _openCupsPage,
            child: ItemHome(
              title: "Tazas",
              image:
                  "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
            ),
          ),
        ],
      ),
    );
  }

  void _openDrinksPage() async {
    await Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => DrinksPage(products: products),
      ),
    ).then((updateProducts) {
      products = updateProducts;
    });
  }
  

  void _openCupsPage() async {
    await Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) =>  CupsPage(products: products),
      ),
    ).then((updateProducts) {
      products = updateProducts;
    });
  }

  void _openGrainsPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GrainsPage(products: products),
      ),
    ).then((updateProducts) {
      products = updateProducts;

    });
  }

   void _openCartPage() async{
    products.cartLista = [];
    await Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => Cart(producto: products.cartLista),
      ),
    ).then((updateProducts) {
      products = updateProducts;
    });

  }

}

