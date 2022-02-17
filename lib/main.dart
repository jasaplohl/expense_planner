import 'package:flutter/material.dart';

import './widgets/app_content.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense planner",
      theme: _customTheme,
      home: AppContent()
    );
  }
}

const String fontFamily = "WorkSans";
const double fontSize = 20;

ThemeData _customTheme = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: fontFamily,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.italic, 
      fontSize: fontSize,
      fontWeight: FontWeight.bold
    )
  ),
  textTheme: const TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold
      )
  )
);