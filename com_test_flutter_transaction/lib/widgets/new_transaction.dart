import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function commitCallback;

  const NewTransaction({Key? key, required this.commitCallback})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0;
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.commitCallback(title, amount);
    Navigator.of(context).pop();
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
