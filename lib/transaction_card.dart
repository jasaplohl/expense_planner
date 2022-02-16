import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionCard extends StatelessWidget {

  final Transaction transaction;
  final TextStyle amountStyle = TextStyle(
    color: Colors.red[300],
    fontWeight: FontWeight.bold
  );
  final EdgeInsets margin = const EdgeInsets.all(5);

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: margin,
            child: Text(transaction.timeStamp.toIso8601String()),
          ),
          Container(
            margin: margin,
            child: Text(transaction.title),
          ),
          Container(
            margin: margin,
            child: Text(
              "-" + transaction.amount.toStringAsFixed(2),
              style: amountStyle,
            ),
          )
        ],
      ),
      elevation: 5,
      color: Colors.blue[100],
    );
  }

}