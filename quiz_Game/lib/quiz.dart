import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/screens/start_screen.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:quiz/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start';
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = 'start';
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen((switchScreen));
    if (activeScreen == 'start') {
      screenWidget = StartScreen((switchScreen));
    }
    if (activeScreen == 'question') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 73, 0, 168),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
