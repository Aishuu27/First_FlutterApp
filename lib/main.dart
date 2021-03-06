import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final questions = const [
    {
      'questionText': 'which is your favourite colour?',
      'answerText': ['Black', 'Red', 'Yellow', 'blue'],
    },
    {
      'questionText': 'what\'s your favoruite animal?',
      'answerText': ['Rabbit', 'Dog', 'Cat', 'tiger'],
    },
    {
      'questionText': 'which tech stack do you work on?',
      'answerText': ['android', 'flutter', 'java', 'sql'],
    },
  ];
  var _questionIndex = 0;
  void _answer() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answerText'] as List<String>)
                      .map((answer) {
                    //print(answer);
                    return Answer(_answer, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text('You did it!!'),
              ),
      ),
    );
  }
}
