import 'package:flutter/material.dart';

// Provider State management to change between themes(Light and Dark).

class ThemeChanger extends ChangeNotifier {
  ThemeData themeData;
  ThemeChanger(this.themeData);

  getTheme() => themeData;
  setTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }
}
