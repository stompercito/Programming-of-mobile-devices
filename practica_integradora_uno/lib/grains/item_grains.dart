import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';

class ItemGrains extends StatefulWidget {
  ProductGrains grain;
  ProductList producto;
  ItemGrains({
    Key key,
    @required this.grain,
    @required this.producto,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openDetailGrainsPage,
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
                    "${widget.grain.productTitle}",
                    style: TextStyle(fontSize: 22.0, color: coffeBlanco),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                    "${widget.grain.productPrice} MX\$",
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
                  "${widget.grain.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: widget.grain.liked ? Colors.red : coffeAzulGrisaceoOscuro,
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
      widget.grain.liked = !widget.grain.liked;
    });
  }

  void _openDetailGrainsPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GrainsDetailPage(grain: widget.grain, productoNuevo: widget.producto),
      ),
    ).then((updateProducts) {
      setState(() {
        widget.producto = updateProducts;
        widget.grain = ProductGrains.setGrain(updateProducts.grains);
        //if(updateProducts.cart != null)
          //widget.cartLista.add(updateProducts.cart);
      });
      
    });
  }

}


