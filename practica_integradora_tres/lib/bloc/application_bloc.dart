import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica_tres/models/barcode_item.dart';
import 'package:practica_tres/models/image_label_item.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  List<ImageLabelItem> _listLabeledItems = List();
  List<BarcodeItem> _listBarcodeItems = List();

  List<ImageLabelItem> get getLabeledItemsList => _listLabeledItems;
  List<BarcodeItem> get getBarcodeItemsList => _listBarcodeItems;

  File _picture;

  @override
  ApplicationState get initialState => ApplicationInitial();

  @override
  Stream<ApplicationState> mapEventToState(
    ApplicationEvent event,
  ) async* {
    // Simula estar cargando datos remotos o locales
    if (event is FakeFetchDataEvent) {
      yield LoadingState();
      await Future.delayed(Duration(milliseconds: 1500));
      yield FakeDataFetchedState();
    }
    // pasar imagen a ui para pintarla
    else if (event is GalleryPictureEvent) {
      await _takePicture(false);
      if (_picture != null) {
        yield PictureChosenState(image: _picture);
      } else {
        yield ErrorState(message: "No se ha seleccionado imagen");
      }
    }
    else if (event is TakePictureEvent) {
      await _takePicture(true);
      if (_picture != null) {
        yield PictureChosenState(image: _picture);
      } else {
        yield ErrorState(message: "No se ha tomado un imagen");
      }
    }
    // detectar objetos en imagenes
    else if (event is ImageDetectorEvent) {
      yield LoadingState();
      await _imgLabeling(_picture);
      yield FakeDataFetchedState();
    }
    // detectar barcoes y qr en imagenes
    else if (event is BarcodeDetectorEvent) {
      yield LoadingState();
      await _barcodeScan(_picture);
      yield FakeDataFetchedState();
    }
  }

  Future<void> _takePicture(bool camera) async {
    if(camera){
      _picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
      );
    } else {
      _picture = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    }
    
  }

  Future<void> _imgLabeling(File imageFile) async {
    String id;
    String label;
    double prob;
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    var visionImage = FirebaseVisionImage.fromFile(imageFile);
    var labelDetector = FirebaseVision.instance.imageLabeler();
    List<ImageLabel> labels = await labelDetector.processImage(visionImage);
    String data = "";
    for (var item in labels) {
      id = item.entityId;
      label = item.text;
      prob = item.confidence;

      data += '''
      >id: $id\n
      >Label: $label\n
      >Certeza: $prob\n
      ---------------\n
      ''';
      
    }
    print("ImagenBase64: " + base64Image + "\n" + data);
    
    _listLabeledItems.add(ImageLabelItem(imagenBase64: base64Image, similitud: prob, identificador: id, texto: label));

    return data;
  }

  Future<void> _barcodeScan(File imageFile) async {
    var code;
    var type;
    var boundBx;
    var corners;
    var url;
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    
    var visionImage = FirebaseVisionImage.fromFile(imageFile);
    var barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List<Barcode> codes = await barcodeDetector.detectInImage(visionImage);
    String data = "";
    for (var item in codes) {
      code = item.rawValue;
      type = item.valueType;
      boundBx = item.boundingBox;
      corners = item.cornerPoints;
      url = item.url;

      data += '''
      >Codigo: $code\n
      >Formato: $type\n
      >URL titulo: ${url == null ? "No disponible":url.title}\n
      >URL: ${url == null ? "No disponible":url.url}\n
      >Area de cod: $boundBx\n
      >Esquinas: $corners\n

      ---------------\n
      ''';
    }
    print("ImagenBase64: " + base64Image + "\n" + data);

    _listBarcodeItems.add(BarcodeItem(imagenBase64: base64Image, codigo: code, tipoCodigo: type.toString(), tituloUrl: url == null ? "No disponible":url.title, url: url, areaDeCodigo: boundBx, puntosEsquinas: corners));

    return data;
  }
}
