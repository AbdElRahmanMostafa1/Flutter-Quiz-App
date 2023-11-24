import 'package:flutter/material.dart';
import './answer_btn.dart';
import './data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.setSelectedAnswer, {super.key});

  final void Function(String answer) setSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  chooseAnswerHandler(String answer) {
    widget.setSelectedAnswer(answer);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      }
    });
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[currentQuestionIndex].answers.map((el) {
              return AnswerButton(
                btnText: el,
                onPressed: () {
                  print(el);
                  chooseAnswerHandler(el);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
