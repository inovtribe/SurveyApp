import 'package:survey_app/quiz.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 5}, 
          {'text': 'Green', 'score': 3}, 
          {'text': 'White', 'score': 1}
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 10}, 
          {'text': 'Snake', 'score': 5}, 
          {'text': 'Elephant', 'score': 3}, 
          {'text': 'Lion', 'score': 1}
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Max', 'score': 10}, 
          {'text': 'Molly', 'score': 5}, 
          {'text': 'Stephan', 'score': 3}, 
          {'text': 'Mike', 'score': 1}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}