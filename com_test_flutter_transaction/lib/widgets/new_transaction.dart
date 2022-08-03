import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function commitCallback;

  const NewTransaction({Key? key, required this.commitCallback})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submit() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (title.isEmpty || amount <= 0 || _selectedDate is! DateTime) {
      return;
    }
    widget.commitCallback(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Title",
              hintText: "transaction title",
            ),
            controller: _titleController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Amount",
              hintText: "transaction amount",
            ),
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submit(),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Text(_selectedDate is! DateTime
                    ? "No Date Chosen!"
                    : DateFormat.yMd().format(_selectedDate as DateTime)),
                TextButton(
                  onPressed: _showDatePicker,
                  child: const Text(
                    "Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Add Transaction"),
          ),
        ],
      ),
    );
  }
}
