import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (userPickedAnswer == quizbrain.getCorrectAnswer()) {
        scorekeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(const Icon(
          Icons.cancel,
          color: Colors.red,
        ));
      }
    });
    if (quizbrain.isFinished()) {
      int correctCount = scorekeeper
          .where((widget) => widget is Icon && widget.icon == Icons.check)
          .length;
      int incorrectCount = scorekeeper.length - correctCount;
      Alert(
              context: context,
              title: "Finished!",
              desc:
                  "The game is over. Correct: $correctCount, Incorrect: $incorrectCount")
          .show();
      quizbrain.reset();

      setState(() {
        scorekeeper = [];
      });
    } else {
      setState(() {
        quizbrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
