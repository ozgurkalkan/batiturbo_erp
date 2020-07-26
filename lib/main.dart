import 'package:bati_turbo_erp/screens/main_screen.dart';
import 'core/locator.dart';
import 'package:flutter/material.dart';


void main() {
  setupLocators();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFF18D191),
      ),
      home: MainScreen(),
    );
  }
}