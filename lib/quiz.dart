import 'package:adv_basics/questions_screen.dart';
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

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  switchScreen() {
    //when setState is called build method is rerendered if anything has changed in widgets tree
    setState(() {
      activeScreen = const QuestionsScreen();
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
                  end: Alignment.bottomRight)),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
