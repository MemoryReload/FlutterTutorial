import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function commitCallback;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.commitCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Title", hintText: "transaction title"),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Amount", hintText: "transaction amount"),
            controller: amountController,
          ),
          ElevatedButton(onPressed: () => commitCallback(titleController.text, double.parse(amountController.text)) , child: const Text("Submit")),
        ],
      ),
    );
  }
}
