import 'package:flutter/material.dart';

import 'login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color(0xff00416a),
        body: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: LoginPage(),
        ),
      ),
    );
  }
}
