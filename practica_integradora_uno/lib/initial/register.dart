
import 'package:flutter/material.dart';

import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coffeAzulOscuro,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/cupping.png'),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 80.0),
            AccentColorOverride(
              color: coffeNaranjaLigero7C,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            AccentColorOverride(
              color: coffeNaranjaLigero7C,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            AccentColorOverride(
              color: coffeNaranjaLigero7C,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(  
                    child: Text(
                      "INGRESA",
                      style: TextStyle(
                        fontFamily: 'Akzidenz-Grotesk',
                      ),
                    ),
                    color: coffeNaranjaGrisaceo,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Home(title: APP_TITLE)),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
