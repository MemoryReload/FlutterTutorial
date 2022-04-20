import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback? resetHandler;

  String get textPhrase {
    if (score < 5) {
      return "Ooops!  You almost got there.";
    } else if (score < 10) {
      return "Congratulations! You did it.";
    } else {
      return "Fantastic! You're doing great.";
    }
  }

  const Result({Key? key, required this.score, this.resetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            textPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: resetHandler,
          child: const Text(
            "Restart the quiz!",
          ),
          // style: TextButton.styleFrom(
          //     primary: Colors.blue,
          //     splashFactory: NoSplash.splashFactory,
          //     textStyle:
          //         const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          style: makeBtnStyle(),
        ),
      ],
    );
  }

  ButtonStyle makeBtnStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) return Colors.pink;
          return Colors.blue;
        },
      ),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
    );
  }
}
