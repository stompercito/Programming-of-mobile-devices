import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/payment.dart';

class GrainsDetailPage extends StatefulWidget {
  ProductGrains grain;
  ProductList productoNuevo;
  
  GrainsDetailPage({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _DetailGrainsState createState() => _DetailGrainsState();
}

class _DetailGrainsState extends State<GrainsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.grain.productTitle}", style: TextStyle(color: coffeBlanco),),
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
                "${widget.grain.productTitle}",
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
    //widget.productoNuevo.cups.liked = widget.cup.liked;
    setState(() {
      widget.grain.liked = !widget.grain.liked;
      widget.productoNuevo = ProductList.setGrain(widget.grain);   
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
      widget.productoNuevo = ProductList.setGrain(widget.grain);
      Navigator.of(context).pop(widget.productoNuevo);

  }

}
