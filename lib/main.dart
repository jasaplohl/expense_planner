import 'package:flutter/material.dart';

import 'widgets/transaction_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  final String appName = "Expense planner";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(appName),),
        body: Container(
          child: TransactionPage(),
          margin: EdgeInsets.all(10),
        ) 
      )
    );
  }

}