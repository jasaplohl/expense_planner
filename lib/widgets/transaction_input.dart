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

    if(isDataValid(title, amount)) {
      widget.addTransaction(title, amount);
      // Close the modal sheet
      // Context is defined class wide in the State class
      Navigator.of(context).pop();
      clearInputFields();
    }

  }

  void clearInputFields() {
    titleController.text = "";
    amountController.text = "";
  }

  bool isDataValid(String title, double amount) {
    bool valid = title.isNotEmpty && amount > 0;
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ElevatedButton(
          onPressed: () {
            submitTransaction();
          }, 
          child: Text("Add Transaction")
        )
      ]
    );
  }
}