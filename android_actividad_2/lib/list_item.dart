import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, String> content;
  ListItem({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                content["image"],
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff4169D8),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      content["title"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(content["description"]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}