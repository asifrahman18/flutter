import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerSet, this.onTap, {super.key});
  final String answerSet;
  final void Function() onTap;

  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
      child: Text(
        answerSet,
        textAlign: TextAlign.center,
      ),
    );
  }
}
