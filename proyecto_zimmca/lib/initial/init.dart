
import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/initial/login.dart';
import 'package:proyecto_zimmca/initial/register.dart';
import 'package:proyecto_zimmca/utils/colors.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

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
            SizedBox(height: 100.0),
            MaterialButton(  
                    child: Text(
                      "REGISTRATE",
                      style: TextStyle(
                        fontFamily: 'Akzidenz-Grotesk',
                      ),
                    ),
                    color: coffeNaranjaGrisaceo,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegisterPage()),
                      );
                    },
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
                        MaterialPageRoute(builder: (_) => LoginPage()),
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
