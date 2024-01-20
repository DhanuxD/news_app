import 'package:flutter/material.dart';
import 'package:news_app/constant/themes.dart';

class ChangeTheme with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;

  set(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
  }
}
//    changeTheme(ThemeData value) {
//     ThemeData currentTheme = value;
//     if (currentTheme == lightTheme) {
//       currentTheme = darkTheme;
//     } else {
//       currentTheme = darkTheme;
//     }
//   }
// notifyListeners();