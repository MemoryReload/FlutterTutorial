import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function commitCallback;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.commitCallback}) : super(key: key);

  void submit() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0;
    if (title.isEmpty || amount <= 0) {
      return;
    }
    commitCallback(title, amount);
  }

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
              onSubmitted: (_) => submit()),
          TextField(
            decoration: const InputDecoration(
                labelText: "Amount", hintText: "transaction amount"),
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submit(),
          ),
          ElevatedButton(onPressed: submit, child: const Text("Submit")),
        ],
      ),
    );
  }
}
