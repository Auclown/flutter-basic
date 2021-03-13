import "package:flutter/material.dart";

import "./question.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  List<String> questions = [
    "What is your favourite colour?",
    "What is your favourite animal?"
  ];

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("First App")),
        body: Column(
          children: <Widget>[
            Text("Question"),
            RaisedButton(
                child: Text(questions[_questionIndex]),
                onPressed: answerQuestion),
            RaisedButton(child: Text("Answer 2"), onPressed: answerQuestion),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: answerQuestion,
            )
          ],
        ),
      ),
    );
  }
}
