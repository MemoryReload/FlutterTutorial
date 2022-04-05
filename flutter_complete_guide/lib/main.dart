import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import './question.dart';
import './answer.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print('press answer0');
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What\'s your favourite color?',
        'answers': ["Answer 1", "Answer 2", "Answer 3"]
      },
      {
        'question': 'What\'s your favourite animal?',
        'answers': ["Answer 1", "Answer 2", "Answer 3", "Answer 4"]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyApp"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['question'] as String),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((e) => Answer(
                            text: e,
                            callback: _answerQuestion,
                          ))
                      .toList()
                ],
              )
            : const Center(
                child: Text('you\'ve done it!'),
              ),
      ),
    );
  }
}
