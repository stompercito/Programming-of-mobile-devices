import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/profile.dart';

class Cart extends StatefulWidget {
  final List<ProductCart> producto;
  Cart({
    Key key,
    @required this.producto,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.producto) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras", style: TextStyle(color: coffeBlanco),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _backUpAndCart,
        ),
        actions: <Widget>[
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
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.producto.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.producto[index],
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text("Total: \$$_total"),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
      Navigator.of(context).pop(ProductList.setCart(widget.producto));

  }
}