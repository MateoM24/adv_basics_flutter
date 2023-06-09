import 'package:adv_basics/models/questions.dart';
import 'package:flutter/material.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuestion.text,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.answers
              .map((answer) => AnswerButton(answerText: answer, onTap: () {})),
        ],
      ),
    );
  }
}
