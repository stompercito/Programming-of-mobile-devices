import 'package:flutter/material.dart';
import 'dart:math';

class SecondPage extends StatelessWidget {
  final String texto;
  final _random = new Random();
  int _number = 384;
  TextEditingController _textController = TextEditingController();

  SecondPage({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
              
      body: Container(
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
                _number = _random.nextInt( 1000 - 0);
              },
            color: Colors.white,
            ),
            MaterialButton(
              child: Text("Guardar"),
              onPressed: () {
                Navigator.of(context).pop(texto + _number.toString());
              },
            color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
