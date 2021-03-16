import "package:flutter/material.dart";

import "./question.dart";
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  static const List<Map> questions = const [
    {
      "questionText": "What is your favourite colour?",
      "answer": ["Black", "Red", "Green", "White"]
    },
    {
      "questionText": "What is your favourite animal?",
      "answer": ["Rabbit", "Dog", "Lion", "Snake"]
    },
    {
      "questionText": "What is your favourite video game?",
      "answer": ["CoD:MW", "Starcraft", "Halo", "Gears of War"]
    },
  ];

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("First App")),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]["answer"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
