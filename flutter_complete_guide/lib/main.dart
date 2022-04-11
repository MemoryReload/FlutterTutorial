import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'quiz.dart';

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
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'question': 'What\'s your favourite color?',
        'answers': [
          {"anwser": "Answer 1", "score": 8},
          {"anwser": "Answer 2", "score": 6},
          {"anwser": "Answer 3", "score": 5}
        ]
      },
      {
        'question': 'What\'s your favourite animal?',
        'answers': [
          {"anwser": "Answer 1", "score": 4},
          {"anwser": "Answer 2", "score": 8},
          {"anwser": "Answer 3", "score": 7},
          {"anwser": "Answer 3", "score": 3}
        ]
      },
      {
        'question': 'What\'s your favourite sport?',
        'answers': [
          {"anwser": "Answer 1", "score": 5},
          {"anwser": "Answer 2", "score": 6},
          {"anwser": "Answer 3", "score": 2},
          {"anwser": "Answer 3", "score": 1}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyApp"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                question: _questions[_questionIndex]["question"] as String,
                answers: _questions[_questionIndex]['answers']
                    as List<Map<String, Object>>,
                callback: _answerQuestion)
            : const Center(
                child: Text('you\'ve done it!'),
              ),
      ),
    );
  }
}
