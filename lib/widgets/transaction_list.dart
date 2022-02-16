import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((transaction) {
          return TransactionCard(transaction);
        })
      ],
    );
  }

}