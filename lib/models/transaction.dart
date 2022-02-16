import 'package:uuid/uuid.dart';

class Transaction {
  String? id;
  final String title;
  final double amount;
  final DateTime timeStamp;

  Transaction({
    required this.title, 
    required this.amount, 
    required this.timeStamp
  }){
    id = const Uuid().v4();
  }
}