import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 20, 148, 20),
      ),
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        background: const Color.fromARGB(255, 255, 255, 255),
        primary: Color.fromARGB(255, 88, 241, 88),
        secondary: Color.fromARGB(255, 20, 148, 20),
        tertiary: Color.fromARGB(255, 100, 149, 104),
      ));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 20, 148, 20),
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Color.fromARGB(255, 88, 241, 88),
        secondary: Color.fromARGB(255, 20, 148, 20),
        tertiary: Color.fromARGB(255, 100, 149, 104),
      ));
}
