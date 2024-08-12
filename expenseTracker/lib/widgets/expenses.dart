import 'package:expense/widgets/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';
import 'package:expense/widgets/expenseList/expenses_list.dart';
import 'package:expense/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text('No expanses added. Add a new item');

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenseList: _registeredExpenses,
        onRemove: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
