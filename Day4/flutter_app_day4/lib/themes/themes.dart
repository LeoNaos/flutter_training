import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData setLightTheme() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );
  }

  static ThemeData setDarkTheme() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: const IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
    );
  }
}
