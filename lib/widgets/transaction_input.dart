import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {

  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final InputDecoration titleInputDecoration = const InputDecoration(
    labelText: "Title"
  );
  final InputDecoration amountInputDecoration = const InputDecoration(
    labelText: "Amount"
  );
  
  TransactionInput(this.addTransaction);

  void submitTransaction() {
    final String title = titleController.text.trim();
    final double amount = double.parse(amountController.text);

    if(title.isNotEmpty && amount > 0) {
      addTransaction(title, amount);
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
            controller: titleController,
          ),
          TextField(
            decoration: amountInputDecoration, 
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => submitTransaction(),
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