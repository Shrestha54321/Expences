import 'package:expense/model/expense.dart';
import 'package:expense/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses, // expenses is a (named)argument/var where data is passed
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense)
      onRemoveExpense; // retruns nth but takes expense as input

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          //to make list swipe and dismiss
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])), //ExpenseItem widget is called
    );
  }
}
