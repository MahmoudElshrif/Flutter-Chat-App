import 'package:chatapp/pages/Login.dart';
import 'package:chatapp/Themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage(), theme: lightTheme);
  }
}
