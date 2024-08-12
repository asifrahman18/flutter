import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }

  final void Function(String answer) onSelectAnswer;
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var questionIndex = 0;

  void nextQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final question = questions[questionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.text,
                style: GoogleFonts.tiltNeon(
                  color: const Color.fromARGB(255, 174, 235, 220),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...question.shuffledAnswers().map((item) {
                return AnswerButton(item, () {
                  nextQuestion(item);
                });
              }),
            ],
          ),
        ));
  }
}
