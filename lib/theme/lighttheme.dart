import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
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
  )
);
