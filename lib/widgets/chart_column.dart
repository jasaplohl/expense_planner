import 'package:flutter/material.dart';

class ChartColumn extends StatelessWidget {

  final String day;
  final double sum;

  ChartColumn(this.day, this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        Text(sum.toStringAsFixed(2))
      ],
    );
  }

}