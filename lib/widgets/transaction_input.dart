import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {

  final Function addTransaction;
  
  TransactionInput(this.addTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();

}

class _TransactionInputState extends State<TransactionInput> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

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

    if(title.isNotEmpty && amount > 0) {
      widget.addTransaction(title, amount);
    }

    titleController.text = "";
    amountController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: titleInputDecoration,
            keyboardType: TextInputType.text,
            controller: titleController,
          ),
          TextField(
            decoration: amountInputDecoration, 
            keyboardType: TextInputType.number,
            controller: amountController,
          ),
          ElevatedButton(
            onPressed: () => {
              submitTransaction()
            }, 
            child: Text("Add Transaction")
          )
        ]
      ),
    );
  }
}