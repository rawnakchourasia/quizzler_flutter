import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';

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

  int questionNumber = 0;

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
                quizbrain.questionBank[questionNumber].questionText,
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
                setState(() {
                  bool isAnswerCorrect =
                      quizbrain.questionBank[questionNumber].questionAns;
                  if (isAnswerCorrect) {
                    print('User got is right');
                  } else {
                    print('User got it wrong!');
                  }
                  scorekeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                  questionNumber++;
                });

                //The user picked true.
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
                bool isAnswerCorrect =
                    quizbrain.questionBank[questionNumber].questionAns;
                if (!isAnswerCorrect) {
                  print('User got is right');
                } else {
                  print('User got it wrong!');
                }
                setState(() {
                  questionNumber++;
                });

                //The user picked false.
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

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
