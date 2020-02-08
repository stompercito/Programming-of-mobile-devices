import 'package:android_actividad_2/list_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Act 2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Actividad 2'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];

  Future<void> _showSelectionDialog(String title, BuildContext ctx) async {
    await showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: Text("Seleccionado"),
          content: Text("Elemento seleccionado: $title"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xff324aa8),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Seleccione pelicula",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listElements.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => _showSelectionDialog(
                          _listElements[index]["title"], context),
                      child: ListItem(content: _listElements[index]));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}