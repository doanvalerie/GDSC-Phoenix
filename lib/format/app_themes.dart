import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static const int lightGray = 0;
  static const int lightRed = 1;
  static const int lightOrange = 2;
  //static const int lightYellow = 3;
  static const int lightGreen = 4;
  static const int lightBlue = 5;
  static const int lightPurple = 6;
  static const int lightPink = 7;
  static const int dark = 8;
}

final themeCollection = ThemeCollection(
  themes: {
    AppThemes.lightGray: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.grey,
    ),
    AppThemes.lightRed: ThemeData(primarySwatch: Colors.red),
    AppThemes.lightOrange: ThemeData(primarySwatch: Colors.orange),
    //AppThemes.lightYellow: ThemeData(primarySwatch: Colors.yellow),
    AppThemes.lightGreen: ThemeData(primarySwatch: Colors.green),
    AppThemes.lightBlue: ThemeData(primarySwatch: Colors.blue),
    AppThemes.lightPurple: ThemeData(primarySwatch: Colors.purple),
    AppThemes.lightPink: ThemeData(primarySwatch: Colors.pink),
    AppThemes.dark: ThemeData.dark(),
  },
  fallbackTheme: ThemeData(primarySwatch: Colors.grey),
);