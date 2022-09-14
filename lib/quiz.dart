// ignore_for_file: invalid_required_positional_param

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  const Quiz({required this.answerQuestion,required this.questions,required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Question(
            questions[questionIndex]['question'],
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['score']), answer['text']);
          }).toList(),
        ],
      ),
    );
  }
}
