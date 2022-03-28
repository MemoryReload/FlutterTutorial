import 'package:flutter/material.dart';
import './question.dart';

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
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyApp"),
        ),
        body: Column(
          children: [
            Question(questions.elementAt(_questionIndex)),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: const Text('Answer 0'),
            ),
            ElevatedButton(
              onPressed: () => print('press answer1'),
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () {
                print('press');
                print('answer2');
              },
              child: const Text('Answer 2'),
            ),
          ],
        ),
      ),
    );
  }
}
