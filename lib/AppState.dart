import 'package:flutter/material.dart';
import 'dart:io';

class AppState extends ChangeNotifier{
  String _resultText = "";
  File? _photo;

  String get resultText => _resultText;
  File? get photo => _photo;


  void setResult(String value){
    _resultText = value;
    notifyListeners();
  }
  void setPhoto(File file){
    _photo = file;
    print("📷 New photo set: ${file.path}");
    notifyListeners();
  }
  void clearPhoto(){
    _photo = null;
    notifyListeners();
  }
}
