import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade300,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // Matches light's grey[300] but dark
    primary: Colors.grey.shade200, // Inverse of light's grey[800]
    secondary: Colors.grey.shade800, // Inverse of light's grey[200]
    tertiary: Colors.black, // Inverse of light's white
    inversePrimary: Colors.grey.shade800, // Inverse of light's grey[300]
  ),
);
