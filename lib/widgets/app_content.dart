import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_input.dart';
import './transaction_list.dart';
import './chart.dart';

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

  void _addTransaction(String title, double amount, DateTime date) {
    Transaction newTransaction = Transaction(title: title, amount: amount, timeStamp: date);
    
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  // Returns the transactions of the last  days
  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.timeStamp.isAfter(
        DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }

  double getPercentOfHeight(double percent, BuildContext ctx, AppBar appBar) {
    double availableHeight = MediaQuery.of(ctx).size.height - appBar.preferredSize.height;
    availableHeight -= (MediaQuery.of(ctx).padding.top + MediaQuery.of(ctx).padding.bottom);
    return availableHeight * percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(appName),
      actions: [
        IconButton(
          onPressed: () => _onNewTransactionClick(context), 
          icon: addIcon
        )
      ],
    );
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: getPercentOfHeight(30, context, appBar),
                  child: Chart(_recentTransactions)
                ),
                Container(
                  height: getPercentOfHeight(70, context, appBar),
                  child: TransactionList(_transactions, _deleteTransaction)
                )
              ],
            ),
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