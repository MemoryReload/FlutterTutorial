import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemBuilder: (context, index) => Card(
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      transactions[index].amount.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // s.date.toString(),
                        DateFormat("yyyy/MM/dd")
                            .format(transactions[index].date),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ]),
              ),
          itemCount: transactions.length),
    );
  }
}
