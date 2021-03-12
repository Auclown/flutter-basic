import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;

  List<String> questions = [
    "What is your favourite colour?",
    "What is your favourite animal?"
  ];

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
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
                child: Text(questions[questionIndex]),
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
