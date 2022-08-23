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
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 500
                      ? ElevatedButton.icon(
                          onPressed: () {
                            deleteCallback!(transactions[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                          label: const Text("Delete"),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).errorColor),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                        )
                      // ElevatedButton(
                      //     onPressed: () {
                      //       deleteCallback!(transactions[index].id);
                      //     },
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: const [
                      //         Icon(
                      //           Icons.delete,
                      //         ),
                      //         SizedBox(
                      //           width: 8,
                      //         ),
                      //         Text("Delete"),
                      //       ],
                      //     ),
                      //     style: ButtonStyle(
                      //       elevation: MaterialStateProperty.all(0),
                      //       backgroundColor:
                      //           MaterialStateProperty.all(Colors.transparent),
                      //       foregroundColor: MaterialStateProperty.all(
                      //           Theme.of(context).errorColor),
                      //       overlayColor:
                      //           MaterialStateProperty.all(Colors.transparent),
                      //     ),
                      //   )
                      : IconButton(
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
