import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica_tres/models/barcode_item.dart';
import 'package:practica_tres/models/image_label_item.dart';

class Details extends StatefulWidget {
  final BarcodeItem barcode;
  final ImageLabelItem imageLabeled;
  Details({
    Key key,
    this.barcode,
    this.imageLabeled,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    // convierte la string base 64 a bytes para poder pintar Image.memory(Uint8List)
    if (widget.barcode != null) {
      imageBytes = base64Decode(widget.barcode.imagenBase64);
      return Scaffold(
      appBar: AppBar(title: Text("Detalles Barcodes")),
      body: Column( 
        children: <Widget>[
           Center( 
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image.memory(imageBytes),
                ),
                Container(
                  child: CustomPaint(
                    painter: RectPainter(pointsList: widget.barcode.puntosEsquinas),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15, height: 15),
          Container(
            width: 300,
            child: Center( 
              child: Text("Codigo: " + widget.barcode.codigo),
            ),
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("Tipo de codigo: " + widget.barcode.tipoCodigo),
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("Titulo deURL: " + widget.barcode.tituloUrl),
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("URL: " + widget.barcode.url.toString()),
          ),
        ],
      ),   
    );
    } else {
      imageBytes = base64Decode(widget.imageLabeled.imagenBase64);
      return Scaffold(
      appBar: AppBar(title: Text("Detalles Images")),
      body: Column( 
        children: <Widget>[ 
          Center(
            child: Image.memory(imageBytes)
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("Identificador: " + widget.imageLabeled.identificador),
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("Similitud: " + widget.imageLabeled.similitud.toString()),
          ),
          SizedBox(width: 15, height: 15),
          Center(
            child: Text("Descripción: " + widget.imageLabeled.texto),
          ),
        ],
      ),  
    );
    }    
  }
}

class RectPainter extends CustomPainter {
  final List<Offset> pointsList;

  RectPainter({@required this.pointsList});

  @override
  bool shouldRepaint(CustomPainter old) => false;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(pointsList[0], pointsList[2]);
    final line = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(rect, line);
  }
}
