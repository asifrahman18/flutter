import 'package:flutter/material.dart';
import 'package:expense/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 172, 255, 64));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
        titleTextStyle: const TextStyle(fontSize: 24),
      ),
      cardTheme:
          const CardTheme().copyWith(color: kColorScheme.secondaryContainer),
    ),
    home: const Expenses(),
  ));
}
