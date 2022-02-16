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
          ),
          ElevatedButton(
            onPressed: () => {
              addTransaction(
                titleController.text,
                double.parse(amountController.text)
              ),
              titleController.text = "",
              amountController.text = ""
            }, 
            child: Text("Add Transaction")
          )
        ]
      ),
    );
  }

}