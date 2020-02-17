import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/utils/colors.dart';
import 'package:practica_integradora_uno/initial/init.dart';

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
    accentColor: coffeNaranjaLigero7C,
    primaryColor: coffeAzulOscuro,
    buttonColor: coffeNaranjaGrisaceo,
    scaffoldBackgroundColor: coffeAzulOscuro,
    cardColor: coffeNaranjaLigero62,
    textSelectionColor: coffeBlanco,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: coffeNaranjaGrisaceo,
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
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Akzidenz-Grotesk',
    displayColor: coffeBlanco,
    bodyColor: coffeBlanco,
  );
}