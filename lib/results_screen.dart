import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      this.selectedAnswers, this.questions, this.restartQuizHandler,
      {super.key});

  final List<String> selectedAnswers;
  final List<QuizQuestion> questions;
  final void Function() restartQuizHandler;

  int getCorrectNumbers() {
    var correctAnswersCount = 0;
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        correctAnswersCount++;
      }
    }
    return correctAnswersCount;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You get ${getCorrectNumbers()} out of ${selectedAnswers.length} correctly!",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          TextButton.icon(
            onPressed: restartQuizHandler,
            icon: const Icon(Icons.restart_alt),
            label: const Text("Restart Quiz"),
          )
        ],
      ),
    );
  }
}
