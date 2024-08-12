import 'package:flutter/material.dart';
import 'package:rps_game/widgets/player1.dart';
import 'package:rps_game/widgets/player2.dart';
import 'dart:math';

final rand = Random();

class DiceAction extends StatefulWidget {
  const DiceAction({super.key});
  @override
  State<DiceAction> createState() {
    return _DiceAction();
  }
}

class _DiceAction extends State<DiceAction> {
  var img = 'assets/images/rock.png';
  var img1 = 'assets/images/rock.png';
  Widget result = const Text('');

  var score1 = 0;
  var score = 0;

  void reset() {
    setState(() {
      score = 0;
      score1 = 0;
      result = const Text('');
    });
  }

  void clickHandler() {
    var num = rand.nextInt(3) + 1;
    var num1 = rand.nextInt(3) + 1;

    if (num == 1) {
      setState(() {
        img = 'assets/images/rock.png';
      });
    } else if (num == 2) {
      setState(() {
        img = 'assets/images/paper.png';
      });
    } else if (num == 3) {
      setState(() {
        img = 'assets/images/scissors.png';
      });
    }

    if (num1 == 1) {
      setState(() {
        img1 = 'assets/images/rock.png';
      });
    } else if (num1 == 2) {
      setState(() {
        img1 = 'assets/images/paper.png';
      });
    } else if (num1 == 3) {
      setState(() {
        img1 = 'assets/images/scissors.png';
      });
    }

    if (num == num1) {
      result = const Text(
        'Tie',
        style: TextStyle(fontSize: 30),
      );
    } else if (num == 1 && num1 == 2) {
      result = const Text(
        'Player 2 beats Player 1',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score1++;
      });
    } else if (num == 1 && num1 == 3) {
      result = const Text(
        'Player 1 beats Player 2',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score++;
      });
    } else if (num == 2 && num1 == 1) {
      result = const Text(
        'Player 1 beats Player 2',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score++;
      });
    } else if (num == 2 && num1 == 3) {
      result = const Text(
        'Player 2 beats Player 1',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score1++;
      });
    } else if (num == 3 && num1 == 1) {
      result = const Text(
        'Player 2 beats Player 1',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score1++;
      });
    } else if (num == 3 && num1 == 2) {
      result = const Text(
        'Player 1 beats Player 2',
        style: TextStyle(fontSize: 30),
      );
      setState(() {
        score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Player1(image: img),
            const SizedBox(
              width: 60,
            ),
            Player2(image: img1)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Score",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(
              width: 50,
            ),
            Text(score1.toString(), style: const TextStyle(fontSize: 40)),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        result,
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: clickHandler,
          child: const Text(
            'Go',
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: reset,
          child: const Text(
            'Reset Score',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
