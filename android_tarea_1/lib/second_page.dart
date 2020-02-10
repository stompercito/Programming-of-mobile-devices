import 'package:flutter/material.dart';
import 'dart:math';

String texto;
BuildContext cotx;

class SecondPage extends StatelessWidget {
  String texto1;
  TextEditingController _textController = TextEditingController();

  SecondPage({Key key, this.texto1}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    texto = texto1;
    cotx = context;
    return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(
          title: Text("Pantalla 2"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
              ),
            ),
          ),  
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _random = new Random();
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
            ),
          ),
        child: Column(
          children: <Widget>[
            Container(
              width: 1000,
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Genere numero random",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("$_number", style: 
                TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
            ),
            
            MaterialButton(
              child: Text("Generar"),
              onPressed: () {
                setState(() {
                _number = _random.nextInt( 1000 - 0);
              });
                
              },
            color: Colors.white,
            ),
            MaterialButton(
              child: Text("Guardar"),
              onPressed: () {
                Navigator.of(cotx).pop(texto + _number.toString());
              },
            color: Colors.white,
            ),
          ],
        ),
      );
  }
}

