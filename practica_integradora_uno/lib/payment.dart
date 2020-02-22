import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/listOfProducts.dart';

import 'package:practica_integradora_uno/drinks/drinks_page.dart';

import 'package:practica_integradora_uno/cups/cups_page.dart';

import 'package:practica_integradora_uno/grains/grains_page.dart';

import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/colors.dart';

class Payment extends StatefulWidget {
  final String title;
  Payment({Key key, this.title}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Pagos", style: TextStyle(color: coffeBlanco),),
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
      body: ListView(
        children: <Widget>[
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 35.0),
                child: Text("Ellige tu método de pago:", textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0, color: coffeAzulGrisaceoOscuro)),
              ),
            ],
          ),
          GestureDetector(
            onTap: _showAlertDialog(context),
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
                          "Tarjeta de crédito",
                          style: TextStyle(fontSize: 22.0, color: coffeBlanco),
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
                        "https://previews.123rf.com/images/sabuhinovruzov/sabuhinovruzov1705/sabuhinovruzov170501478/78615017-tarjeta-de-cr%C3%A9dito-en-icono-de-vector-de-mano-ilustraci%C3%B3n-de-la-tarjeta-en-blanco-y-negro-esquema-de-icon.jpg",
                        fit: BoxFit.fitHeight,
                        height: 180,
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        GestureDetector(
          onTap: _showAlertDialog(context),
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
                        "Tarjeta de crédito",
                        style: TextStyle(fontSize: 22.0, color: coffeBlanco),
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
                      "https://logosmarcas.com/wp-content/uploads/2018/03/PayPal-s%C3%ADmbolo.png",
                      fit: BoxFit.fitHeight,
                      height: 180,
                    ),
                  ),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: _showAlertDialog(context),
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
                        "Tarjeta de crédito",
                        style: TextStyle(fontSize: 22.0, color: coffeBlanco),
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
                      "https://image.flaticon.com/icons/png/512/677/677182.png",
                      fit: BoxFit.fitHeight,
                      height: 180,
                    ),
                  ),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
          /*GestureDetector(
            onTap: _showAlertDialog(context),
            child: ItemHome(
              title: "Café de grano",
              image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          GestureDetector(
            onTap: _showAlertDialog(context),
            child: ItemHome(
              title: "Tazas",
              image:
                  "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
            ),
          ),*/
        ],
      ),
    );
  }

 _showAlertDialog(BuildContext ctx) {
   print("se logro");
    /*showDialog(
        context: ctx,
        builder: (context) {

          return AlertDialog(
            title: Text("Add data"),
            
            actions: <Widget>[
              RaisedButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
            ],
          );
        });*/
  }
}
