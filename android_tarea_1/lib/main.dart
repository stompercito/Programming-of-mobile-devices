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

class PageOne extends StatefulWidget {
  
  PageOne({
    Key key,
  }) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String _params = "hola desde p1";
  String _callBackParams2 = "";
  String _callBackParams3 = "";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "BIENVENIDOS",
              style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 48,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.asset(
              "assets/images/Dash.png",
              height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Seleccione la acción a realizar:",
                style: TextStyle(
                  fontFamily: 'Roboto Mono',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.all(34.0),             
                child: MaterialButton(
                  child: Text(
                    "Pagina 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    //_openSecondPage(context);
                    _showAlertDialog(context);
                  },
                ),
                ),
            Padding(
              padding: EdgeInsets.all(34.0),  
              child: MaterialButton(
                child: Text(
                  "Pagina 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  _openThirdPage(context);
                },
              ),
            ),
            ],
            ),
            Text("Pg.2$_callBackParams2"),
            Text("Pg.3$_callBackParams3"),            
          ],
        ),
      ),
    );
  }

  void _openThirdPage(BuildContext context) async {
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/thirdPage",
      arguments: _params,
    ).then(
      (response) {
        _callBackParams3 = response;
      },
    );
  }

  _showAlertDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (context) {
          TextEditingController _textController = TextEditingController();

          return AlertDialog(
            title: Text("Add data"),
            content: TextField(
              controller: _textController,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Ingrese palabra",
                hintText: "Palabra",
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("Aceptar"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Navigator.of(context)
                      .pushNamed(
                    "/secondPage",
                    arguments: _textController.text,
                  )
                      .then(
                    (response) {
                      _callBackParams2 = response;
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
            ],
          );
        });
  }
}