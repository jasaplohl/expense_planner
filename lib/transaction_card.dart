import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

class TransactionCard extends StatelessWidget {

  final Transaction transaction;

  final TextStyle amountStyle = TextStyle(
    color: Colors.red[300],
    fontWeight: FontWeight.bold,
    fontSize: 20
  );
  final TextStyle itemStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15
  );
  final TextStyle dateStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 13
  );

  final EdgeInsets margin = const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15
  );

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: itemStyle,
                ),
                Text(
                  DateFormat.yMMMd().format(transaction.timeStamp),
                  style: dateStyle,
                ),
              ],
            ),
            margin: margin,
          ),
          Container(
            margin: margin,
            child: Text(
              "\$ -${transaction.amount.toStringAsFixed(2)}",
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