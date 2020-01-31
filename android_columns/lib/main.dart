import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'columnas ejemplo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sesion 3 actividad'),
        ),
        body: HomePage(),
        ),
      ),
    )
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_circle,
            size: 48,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                "Flutter McFlutter", 
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.start
              ,),
              Text(
                "Experienced app developer",
                textAlign: TextAlign.start,
              )
            ],
            )
          ],
        )
      ],
    );
  }
}