import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_input.dart';
import './transaction_list.dart';

class AppContent extends StatefulWidget {

  @override
  _AppContentState createState() => _AppContentState();

}

class _AppContentState extends State<AppContent> {
  final String appName = "Expense planner";
  final Icon addIcon = const Icon(Icons.add);

  final List<Transaction> _transactions = [
    Transaction(title: "Shoes", amount: 99.99, timeStamp: DateTime.now()),
    Transaction(title: "Pizza", amount: 10.00, timeStamp: DateTime.now()),
    Transaction(title: "Gas", amount: 35.43, timeStamp: DateTime.now()),
  ];

  void _onNewTransactionClick(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return TransactionInput(_addTransaction);
      }
    );
  }

  void _addTransaction(String title, double amount) {
    Transaction newTransaction = Transaction(title: title, amount: amount, timeStamp: DateTime.now());
    
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appName),
          actions: [
            IconButton(
              onPressed: () => _onNewTransactionClick(context), 
              icon: addIcon
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: TransactionList(_transactions),
            margin: EdgeInsets.all(10),
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: addIcon,
          onPressed: () => _onNewTransactionClick(context),
        ),
      );
  }
}