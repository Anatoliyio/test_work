import 'package:flutter/material.dart';

class SwapTheme with ChangeNotifier{
  bool isLightTheme = false;

  bool get getTheme => isLightTheme;

  void updateTheme(){
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}