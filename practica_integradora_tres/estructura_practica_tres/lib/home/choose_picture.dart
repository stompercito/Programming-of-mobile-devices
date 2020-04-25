import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_tres/bloc/application_bloc.dart';

class ChoosePicture extends StatefulWidget {
  ChoosePicture({
    Key key, 
  }) : super(key: key);

  @override
  _ChoosePictureState createState() => _ChoosePictureState();
}

class _ChoosePictureState extends State<ChoosePicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar imagen")),
      body: BlocListener<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state is ErrorState) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("${state.message}"),
                  duration: Duration(milliseconds: 600),
                ),
              );
          }
        },
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state is PictureChosenState) {
              return Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 24),
                    Image.file(
                      state.image,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 24),
                    RaisedButton(
                      child: Text("Analizar"),
                      onPressed: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<ApplicationBloc>(context)
                            .add(BarcodeDetectorEvent());
                      },
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text("Agrega una imagen"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        tooltip: "Agregar imagen",
        child: Icon(Icons.add_photo_alternate),
        onPressed: () {
            BlocProvider.of<ApplicationBloc>(context).add(GalleryPictureEvent());
        },
      ),
    );
  }
}
