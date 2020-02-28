import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/home/home.dart';
import 'package:proyecto_zimmca/utils/constants.dart';
import 'package:proyecto_zimmca/utils/colors.dart';
import 'package:proyecto_zimmca/initial/init.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      home: Home(title: APP_TITLE),
      initialRoute: '/init', 
      onGenerateRoute: _getRoute,
      theme: _coffeTheme,
    );
  }
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/init') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => InitPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _coffeTheme = _buildCoffeTheme();

ThemeData _buildCoffeTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: coffeNaranjaGrisaceo,
    primaryColor: coffeAzulOscuro,
    buttonColor: coffeNaranjaGrisaceo, //Botones
    cardColor: coffeNaranjaGrisaceo, //cards
    scaffoldBackgroundColor: coffeBlanco, //Fondo
    textSelectionColor: coffeBlanco,

    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: coffeNaranjaGrisaceoClaro,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: coffeBlanco
    ),
    textTheme: _buildCoffeTextTheme(base.textTheme),
    primaryTextTheme: _buildCoffeTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCoffeTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildCoffeTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
      color: coffeBlanco,
    ),
    title: base.title.copyWith(
        fontSize: 18.0

    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 10.0,
    ),
  ).apply(
    fontFamily: 'Akzidenz-Grotesk',
    displayColor: coffeBlanco,
    bodyColor: coffeAzulGrisaceoOscuro, //Color de letra
  );
}