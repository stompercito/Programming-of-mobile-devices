import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();

  ThirdPage({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla 3"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Ingrese palabra",
                  hintText: "Palabra",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}