import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, String> content;
  ListItem({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  150,
      child:  Stack(
        children: <Widget>[
          Image.network(content["Image"])
        ],
      ),
    );
  }
}