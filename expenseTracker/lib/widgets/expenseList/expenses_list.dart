import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';
import 'package:expense/widgets/expenseList/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenseList, required this.onRemove});

  final void Function(Expense expense) onRemove;

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        key: ValueKey(expenseList[index]),
        onDismissed: (direction) {
          onRemove(expenseList[index]);
        },
        child: ExpenseItem(expenseList[index]),
      ),
    );
  }
}
