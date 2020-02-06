import 'package:android_tarea_1/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Pagina 2",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              _openSecondPage(context);
            },
            
          ),
        ),
      ),
    );
  } 

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    ).then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }

  void _openThirdPage(BuildContext context) async {
    String _datoRetornadoDeThirdPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/thirdPage",
      arguments: _params,
    ).then(
      (response) {
        _datoRetornadoDeThirdPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeThirdPage",
        ),
      ),
    );
  }
}