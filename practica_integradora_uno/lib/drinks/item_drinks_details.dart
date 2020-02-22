import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/payment.dart';

class DrinkDetailPage extends StatefulWidget {
  ProductDrinks drink;
  ProductList productoNuevo;

  DrinkDetailPage({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _DetailDrinkState createState() => _DetailDrinkState();
}

class _DetailDrinkState extends State<DrinkDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}", style: TextStyle(color: coffeBlanco),),
        leading: IconButton(icon: Icon(Icons.arrow_back), 
          onPressed: _backUpAndCart,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
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
      body: Card(
      color: coffeNaranjaLigero62,
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                "${widget.drink.productTitle}",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "${widget.drink.productImage}",
                fit: BoxFit.fitHeight,
                height: 180,
              ),
            ),
            flex: 3,
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: widget.drink.liked ? Colors.red : coffeAzulGrisaceoOscuro,
            ),
            onPressed: _productLiked,
            )
        ],
      ),
    ),
    );
  }

  void _productLiked(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
    setState(() {
      widget.drink.liked = !widget.drink.liked;
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink);   
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink);
      Navigator.of(context).pop(widget.productoNuevo);

  }

}
