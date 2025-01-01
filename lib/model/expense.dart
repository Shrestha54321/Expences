import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // to generate unique IDs and uuid is 3rd party package
import 'package:intl/intl.dart'; // 3rd party package to format date

final formatter = DateFormat().add_yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank_rounded,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.timer,
  Category.work: Icons.work
};

class Expense {
  Expense({
    //named parameter in constructor
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // (initializer list feature) to generate a unique id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    //its a getter not a method
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.ofCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final item in expenses) {
      //item written in place for expense in video
      sum = sum + item.amount;
    }
    return sum;
  }
}
