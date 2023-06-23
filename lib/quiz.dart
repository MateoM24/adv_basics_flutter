import 'package:adv_basics/models/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

import 'start_screen.dart';

const colors = [
  Color.fromARGB(255, 82, 51, 190),
  Color.fromARGB(255, 106, 20, 128)
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (hasAllQuestionsBeenAnswered()) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
        );
        selectedAnswers = [];
      });
    }
  }

  bool hasAllQuestionsBeenAnswered() {
    return selectedAnswers.length == questions.length;
  }

  switchScreen() {
    //when setState is called build method is rerendered if anything has changed in widgets tree
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
