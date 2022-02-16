import 'package:flutter/material.dart';

import './widgets/app_content.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppContent()
    );
  }
}