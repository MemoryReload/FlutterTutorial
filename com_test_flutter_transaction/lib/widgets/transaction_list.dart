import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function? deleteCallback;
  const TransactionList(
      {Key? key, required this.transactions, this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 600,
      child: listBody(),
    );
  }

  Widget listBody() {
    if (transactions.isEmpty) {
      return const Text("No Transactions!");
    } else {
      return ListView.builder(
          itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    // 'Weekly Groceries',
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      deleteCallback!(transactions[index].id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              ),
          itemCount: transactions.length);
    }
  }
}
