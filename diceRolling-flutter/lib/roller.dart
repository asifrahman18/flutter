import 'package:flutter/material.dart';
import 'dart:math';

final rand = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceNumber = 'assets/images/dice-1.png';

  void clickHandler() {
    var number = rand.nextInt(6) + 1;
    setState(() {
      diceNumber = 'assets/images/dice-$number.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          diceNumber,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: clickHandler,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text('Roll'),
        ),
      ],
    );
  }
}
