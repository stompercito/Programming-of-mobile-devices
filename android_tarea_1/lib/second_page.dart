import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;
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
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Ingrese palabra",
                  hintText: "$texto",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop(texto + " " + _textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}