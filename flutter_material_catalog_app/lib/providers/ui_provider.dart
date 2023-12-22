import 'package:flutter/material.dart';

enum ThemeOptions { light, dark, system }

enum ThemeTextDirection { ltr, rtl, system }

class UiProvider extends ChangeNotifier {
  ThemeData themeData;
  ThemeOptions? themeSelected = ThemeOptions.light;
  TextDirection textDirection = TextDirection.ltr;
  ThemeTextDirection? textDirectionSelected = ThemeTextDirection.system;

  UiProvider(this.themeData);

  ThemeData getTheme() => themeData;

  void toggleTheme(ThemeOptions? value, Brightness systemBrightness) {
    if (value != null) {
      switch (value) {
        case ThemeOptions.light:
          themeData = ThemeData.light();
          break;
        case ThemeOptions.dark:
          themeData = ThemeData.dark();
          break;
        case ThemeOptions.system:
          themeData = systemBrightness == Brightness.light
              ? ThemeData.light()
              : ThemeData.dark();
          break;
      }
      themeSelected = value;
      notifyListeners();
    }
  }

  void toggleTextDirection(
      ThemeTextDirection value, TextDirection systemTextDirection) {
    switch (value) {
      case ThemeTextDirection.ltr:
        textDirection = TextDirection.rtl;
        break;
      case ThemeTextDirection.rtl:
        textDirection = TextDirection.ltr;
        break;
      case ThemeTextDirection.system:
        textDirection = systemTextDirection;
    }
    textDirectionSelected = value;
    notifyListeners();
  }
}
