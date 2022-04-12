import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function callback;
  const Quiz(
      {Key? key,
      required this.question,
      required this.answers,
      required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question),
        ...answers
            .map((e) => Answer(
                  text: e["anwser"] as String,
                  callback: () => callback(e["score"]),
                ))
            .toList()
      ],
    );
  }
}
