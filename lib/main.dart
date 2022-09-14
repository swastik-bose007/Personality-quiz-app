import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyFlutterApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'question': 'what\'s your favourite color',
      'answers': [
        {'text': 'black', 'score': 40},
        {'text': 'green', 'score': 55},
        {'text': 'blue', 'score': 50},
        {'text': 'white', 'score': 40},
      ],
    },
    {
      'question': 'what\'s your favourite animal',
      'answers': [
        {'text': 'tiger', 'score': 50},
        {'text': 'cat', 'score': 45},
        {'text': 'lion', 'score': 30},
        {'text': 'dog', 'score': 40},
      ],
    },
    {
      'question': 'what\'s your favourite food',
      'answers': [
        {'text': 'indian', 'score': 60},
        {'text': 'chinese',  'score': 40},
        {'text': 'veg',  'score': 50},
        {'text': 'non-veg', 'score': 52},
      ],
    },
  ];

  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('more questions');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Personality Quiz'),
      ),
      body: (_questionIndex < _questions.length)
          ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions,)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
