import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    hintColor: Colors.lightGreen,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
      bodyLarge: TextStyle(fontSize: 14, color: Colors.black87),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
