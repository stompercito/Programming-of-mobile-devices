import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:android/local_auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is DoneEvent){
      yield HomeInitial();
    }else if(event is AuthenticationEvent){
      //Mandamos hablar al metodo para corroborar que se puede acceder al biometric, sino se encuentran
      if(!await _checkBiometrics()){
        yield AuthenticationFailure(
          message: "No se encuentran sensores biometricos",
        );
      }
      if (await _authenticate())
        yield AuthenticationDone();
      else
        yield AuthenticationFailure(message: "Ususario desconocido");
    } else if(event is LoadImageEvent){
      yield LoadedImage(image: await _pickImageFromGallery());
    }
    
  }

  Future<File> _pickImageFromGallery()async {
    //Recordar poner permiso en el manifest
    final File choosenImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return choosenImage;
  }

  Future<bool> _checkBiometrics() async{
    //Metodo para corroborar el biometrico
    try{
      return await _localAuth.canCheckBiometrics;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

  Future<bool> _authenticate() async{
    try{
      return await _localAuth.authenticateWithBiometrics(
        localizedReason: "Ponga su huella en el escaner",
        //StickyAuth funciona por si tu celular entra en background
        stickyAuth: true,
        useErrorDialogs: true, //Utiliza los dialogos de erros por default
      );
    }catch(e){
      print(e.toString());
      return false;
    }
  }

}