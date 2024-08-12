import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [
          Color.fromARGB(255, 16, 60, 202),
          Color.fromARGB(255, 23, 6, 119)
        ]),
      ),
    ),
  );
}
