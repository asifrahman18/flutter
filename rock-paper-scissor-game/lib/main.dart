import 'package:flutter/material.dart';
import 'package:rps_game/widgets/screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Screen(),
      ),
    ),
  );
}
