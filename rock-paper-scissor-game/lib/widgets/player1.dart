import 'package:flutter/material.dart';

class Player1 extends StatelessWidget {
  const Player1({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Player 1',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          image,
          width: 120,
        ),
      ],
    );
  }
}
