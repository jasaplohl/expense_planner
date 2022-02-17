import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: 
        transactions.isNotEmpty ?
          ListView.builder(
            itemBuilder: (context, index) {
              return TransactionCard(transactions[index]);
            },
            itemCount: transactions.length,
          )
        :
          Image.asset("assets/images/no_items.png", fit: BoxFit.cover),
    );
  }

}