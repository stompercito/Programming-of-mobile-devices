import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';
import 'package:practica_integradora_uno/payment.dart';
import 'package:practica_integradora_uno/profile.dart';

class Cart extends StatefulWidget {
  ProductList producto;
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
    for (var item in widget.producto.cartLista) {
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
              itemCount: widget.producto.cartLista.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.producto.cartLista[index],
                );
              },
            ),
          ),
          Container(
            child: Positioned(
              bottom: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 140,
                    child: Text("Total",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: coffeAzulGrisaceoOscuro),
                    ),
                  ), 
                  Container(
                    width: 140,
                    child: Text("$_total MX\$",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: coffeAzulGrisaceoOscuro),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Positioned(
              bottom: 0,
              right: 140,
              child: Column(
                children: <Widget>[
                  MaterialButton( 
                  color: coffeNaranjaGrisaceoClaro,
                  child: Text("PAGAR"),
                  onPressed: _openPaymentPage,
                  ),
                ],
              ),
            ),
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

  void _openPaymentPage(){
    Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => Payment(),
      ),
    );
  }

  void _backUpAndCart(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
      Navigator.of(context).pop(ProductList.setCart(widget.producto, widget.producto.cartLista));

  }
}