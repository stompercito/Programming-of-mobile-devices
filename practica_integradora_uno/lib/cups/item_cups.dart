import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/models/product_cups.dart'; 
import 'package:practica_integradora_uno/cups/item_cups_details.dart'; 
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/cart/cart.dart';

class ItemCups extends StatefulWidget {
  ProductCups cups;
  ProductList producto;
  ItemCups({
    Key key,
    @required this.cups,
    @required this.producto,
  }) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openDetailCupsPage,
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
                    "${widget.cups.productTitle}",
                    style: TextStyle(fontSize: 22.0, color: coffeBlanco),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                    "${widget.cups.productPrice}",
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
                  "${widget.cups.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: widget.cups.liked ? Colors.red : coffeAzulGrisaceoOscuro,
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
      widget.cups.liked = !widget.cups.liked;
    });
  }

  void _openDetailCupsPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CupsDetailPage(cup: widget.cups, productoNuevo: widget.producto),
      ),
    ).then((updateProducts) {
      setState(() {
        widget.producto = updateProducts;
        widget.cups = ProductCups.setCup(updateProducts.cups);
        //if(updateProducts.cart != null)
          //widget.cartLista.add(updateProducts.cart);
      });
      
    });
  }

}


