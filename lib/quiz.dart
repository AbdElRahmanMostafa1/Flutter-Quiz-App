import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import './start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreensHandler);
  }

  void switchScreensHandler() {
    setState(() {
      activeScreen = QuestionsScreen(setSelectedAnswer);
    });
  }

  void restartQuizHandler() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(setSelectedAnswer);
    });
  }

  void setSelectedAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen =
            ResultsScreen(selectedAnswers, questions, restartQuizHandler);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 70, 10, 173),
                Color.fromARGB(255, 88, 21, 203)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
