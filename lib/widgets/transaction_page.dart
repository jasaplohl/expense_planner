import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_input.dart';
import './transaction_list.dart';

class TransactionPage extends StatefulWidget {

  @override
  _TransactionPageState createState() => _TransactionPageState();

}

class _TransactionPageState extends State<TransactionPage> {

  final List<Transaction> _transactions = [
    Transaction(title: "Shoes", amount: 99.99, timeStamp: DateTime.now()),
    Transaction(title: "Pizza", amount: 10.00, timeStamp: DateTime.now()),
    Transaction(title: "Gas", amount: 35.43, timeStamp: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    if(title.isNotEmpty && amount > 0) {
      Transaction newTransaction = Transaction(title: title, amount: amount, timeStamp: DateTime.now());
      
      setState(() {
        _transactions.add(newTransaction);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionInput(_addTransaction),
        TransactionList(_transactions)
      ],
    );
  }

}