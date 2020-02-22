import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/drinks/item_drinks_details.dart';
import 'package:practica_integradora_uno/utils/colors.dart';

class ItemDrinks extends StatefulWidget {
  ProductDrinks drink;
  ProductList producto;
  ItemDrinks({
    Key key,
    @required this.drink,
    @required this.producto,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openDetailDrinkPage,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                    "${widget.drink.productTitle}",
                    style: TextStyle(fontSize: 22.0, color: coffeBlanco),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                    "${widget.drink.productPrice} MX\$",
                    style: TextStyle(fontSize: 22.0, color: coffeAzulGrisaceoOscuro),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
    setState(() {
      widget.drink.liked = !widget.drink.liked;
    });
  }

  void _openDetailDrinkPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DrinkDetailPage(drink: widget.drink, productoNuevo: widget.producto),
      ),
    ).then((updateProducts) {
      setState(() {
        widget.producto = updateProducts;
        widget.drink = ProductDrinks.setDrink(updateProducts.drinks);
        //if(updateProducts.cart != null)
          //widget.cartLista.add(updateProducts.cart);
      });
      
    });
  }

}