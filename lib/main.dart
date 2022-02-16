import 'package:flutter/material.dart';

import './transaction.dart';
import './transaction_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(title: "Shoes", amount: 99.99, timeStamp: DateTime.now()),
    Transaction(title: "Pizza", amount: 10.00, timeStamp: DateTime.now()),
    Transaction(title: "Gas", amount: 35.43, timeStamp: DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Expense planner"),),
        body: Column(
          children: <Widget>[
            ...transactions.map((transaction) {
              return TransactionCard(transaction);
            })
          ],
        ),
      )
    );
  }

}