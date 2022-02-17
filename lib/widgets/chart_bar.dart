import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String day;
  final double sum;
  double percentage = 0;

  ChartBar(this.day, this.sum, totalSpending) {
    if(totalSpending > 0) {
      percentage = sum/totalSpending;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 20,
          child: FittedBox(
            child: Text("\$ ${sum.toStringAsFixed(0)}")
          ),
        )
      ],
    );
  }

}