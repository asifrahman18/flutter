import 'package:flutter/material.dart';
import 'package:rps_game/widgets/action.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: DiceAction(),
      ),
    );
  }
}
