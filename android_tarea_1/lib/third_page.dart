import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();

  ThirdPage({Key key,  this.texto}) : super(key: key);

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    child: Text("Carita 1"),
                    color: Colors.grey,
                    onPressed: () {
                    Navigator.of(context).pop("Carita 1");
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    child: Text("Carita 2"),
                    color: Colors.grey,
                    onPressed: () {
                    Navigator.of(context).pop("Carita 2");
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    child: Text("Carita 3"),
                    color: Colors.grey,
                    onPressed: () {
                    Navigator.of(context).pop("Carita 3");
                    },
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

