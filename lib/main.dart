import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map> _questions = const [
    {
      "questionText": "What is your favourite colour?",
      "answer": [
        {"text": "Black", "score": 14},
        {"text": "Red", "score": 8},
        {"text": "Green", "score": 7},
        {"text": "White", "score": 11}
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answer": [
        {"text": "Lion", "score": 8},
        {"text": "Dog", "score": 15},
        {"text": "Sheep", "score": 6},
        {"text": "Snake", "score": 0}
      ]
    },
    {
      "questionText": "What is your favourite video game?",
      "answer": [
        {"text": "CoD:MW", "score": 10},
        {"text": "Starcraft", "score": 7},
        {"text": "Halo", "score": 12},
        {"text": "Gears of War", "score": 13}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("First App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
