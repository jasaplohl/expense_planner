import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {

  final Transaction transaction;
  final Function deleteTransaction;

  final TextStyle amountStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20
  );

  TransactionCard(this.transaction, this.deleteTransaction);

  String get formattedDate {
    return DateFormat.yMMMd().format(transaction.timeStamp);
  }

  void onDeleteClick() {
    deleteTransaction(transaction.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                "\$ -${transaction.amount.toStringAsFixed(2)}",
                style: amountStyle,
              )
            ),
          )
        ),
        title: Text(transaction.title),
        subtitle: Text(formattedDate),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: onDeleteClick,
        )
      )
    );
  }

}