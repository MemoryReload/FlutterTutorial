import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;
  const Question(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
      );
}
