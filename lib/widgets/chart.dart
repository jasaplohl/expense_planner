import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // Gets a list of the sum of the transactions for each day of the last
  // week.
  List get getGrouppedTransactionsByDay {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double sumForTheDay = 0;

      for(int i=0; i<recentTransactions.length; i++) {
        if(doTheDatesMatch(recentTransactions[i].timeStamp, weekDay)) {
          sumForTheDay += recentTransactions[i].amount;
        }
      }

      var day = DateFormat("E").format(weekDay);
      return { "day": day,  "amount": sumForTheDay };
    });
  } 

  double get totalSpending {
    return getGrouppedTransactionsByDay.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  bool doTheDatesMatch(DateTime date01, DateTime date02) {
    if(date01.day == date02.day &&
      date01.month == date02.month &&
      date01.year == date02.year) {
        return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List grouppedTransactions = getGrouppedTransactionsByDay;

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...grouppedTransactions.map((dataForDay) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(dataForDay["day"], dataForDay["amount"], totalSpending)
              );
            })
          ]
        )
      )
    );
  }

}