import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetQuiz;
  const Result(this.resultScore, this.resetQuiz, {super.key});

  String get resultPhrase {
    String resultText = 'you have completed';
    if (resultScore >= 150) {
      resultText = 'you are awesome and innocent!';
    } else if (resultScore > 130 && resultScore < 150) {
      resultText = 'you are optimistic and enthusiastic!';
    } else if (resultScore <= 130) {
      resultText = 'you have to improve yourself!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
        child: Center(
            child: Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        ElevatedButton(onPressed: resetQuiz, child: const Text('Restart Quiz!', style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 255, 255),
          ),))
      ],
    )));
  }
}
