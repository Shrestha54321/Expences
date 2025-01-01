import 'package:expense/widgets/chart/chart.dart';
import 'package:expense/widgets/expenses_list.dart';
import 'package:expense/model/expense.dart';
import 'package:expense/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  //Widgetclass
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //StateClass
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 1000,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Cinema',
        amount: 1200,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            )); //ctx is builder context and context is class context(metadata)
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: const Text('expenses deleted!'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('no expenses found,start adding'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('ExpensesTracker'),
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses), //chart from chart.dart
                Expanded(
                    child:
                        mainContent), //wrapped with expanded because it is inside column which also contains column(listview)
              ],
            )
          : Row(children: [
              Chart(expenses: _registeredExpenses),
              Expanded(child: mainContent),
            ]),
    );
  }
}
