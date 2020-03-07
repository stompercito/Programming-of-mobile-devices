import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:android_tarea_3_hive/home/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'models/todo_remainder.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized(); //new
  final appDocumentDirectory = 
    await path_provider.getApplicationDocumentsDirectory(); //new
  Hive.init(appDocumentDirectory.path); //new
  Hive.registerAdapter(TodoRemainderAdapter()); //new
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.grey[50],
      ),
      home: FutureBuilder(
        future: Hive.openBox('todoRemainders'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return HomePage();
          } else
              return Scaffold();
        },  //new
      ), 
    );
  }

  @override
  void dispose() { 
    Hive.close();
    super.dispose();
  }
}
