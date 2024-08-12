import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseItem.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Text(expenseItem.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expenseItem.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenseItem.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
