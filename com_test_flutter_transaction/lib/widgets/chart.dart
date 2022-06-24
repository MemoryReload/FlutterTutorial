import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTrasactions}) : super(key: key);

  final List<Transaction> recentTrasactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      double totalSum = 0;
      recentTrasactions.forEach((element) {
        if (element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year) {
          totalSum += element.amount;
        }
      });
      return {"day": DateFormat.E().format(weekDay), 'amount': 9.99};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
