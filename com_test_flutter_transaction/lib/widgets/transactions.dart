import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", name: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t1",
        name: "Weekly Groceries",
        amount: 102.72,
        date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    setState(() {
      transactions.add(Transaction(
          id: DateTime.now().toString(),
          name: title,
          amount: amount,
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(commitCallback: _addTransaction),
        TransactionList(transactions: transactions)
      ],
    );
  }
}
