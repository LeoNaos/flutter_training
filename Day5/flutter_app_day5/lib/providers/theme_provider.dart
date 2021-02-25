import 'package:flutter/cupertino.dart';

enum ThemeState {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  // Theme State
  ThemeState _currentTheme = ThemeState.light;

  // Change Theme
  ThemeState get currentTheme => _currentTheme;

  set setTheme(ThemeState theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
