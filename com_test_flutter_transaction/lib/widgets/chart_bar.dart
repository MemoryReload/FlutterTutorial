import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {Key? key})
      : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: FittedBox(
              child: Text(
                '\$${spendingAmount.toStringAsFixed(0)}',
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: SizedBox(
              width: 10,
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          color: const Color.fromRGBO(220, 220, 220, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(label)
        ],
      ),
    );
  }
}
