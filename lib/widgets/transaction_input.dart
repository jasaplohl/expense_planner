import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {

  final Function addTransaction;
  
  TransactionInput(this.addTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();

}

class _TransactionInputState extends State<TransactionInput> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime? _date;

  final InputDecoration titleInputDecoration = const InputDecoration(
    labelText: "Title"
  );
  final InputDecoration amountInputDecoration = const InputDecoration(
    labelText: "Amount"
  );
  

  void submitTransaction() {
    final String title = titleController.text.trim();
    double amount;

    if(amountController.text.isNotEmpty) {
      amount = double.parse(amountController.text);
    } else {
      amount = 0;
    }

    if(isDataValid(title, amount, _date)) {
      widget.addTransaction(title, amount, _date);
      // Close the modal sheet
      // Context is defined class wide in the State class
      Navigator.of(context).pop();
      clearInputFields();
    }

  }

  void openDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now()
    )
      .then((value) => {
        setState(() {
          if(value != null) {
            _date = value;
          }
        })
      }
    );
  }

  void clearInputFields() {
    titleController.text = "";
    amountController.text = "";
    _date = null;
  }

  bool isDataValid(String title, double amount, DateTime? date) {
    bool valid = title.isNotEmpty && amount > 0 && date != null;
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: titleInputDecoration,
            keyboardType: TextInputType.text,
            controller: titleController,
            onSubmitted: (_) => submitTransaction(),
          ),
          TextField(
            decoration: amountInputDecoration, 
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => submitTransaction(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_date == null ? "No Date" : DateFormat("dd. MM. yyyy").format(_date as DateTime)),
              TextButton(onPressed: openDatePicker, child: Text("Choose Date"))
            ],
          ),
          ElevatedButton(
            onPressed: () {
              submitTransaction();
            }, 
            child: Text("Add Transaction")
          )
        ]
      )
    );
  }
}