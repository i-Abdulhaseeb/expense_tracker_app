import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_list.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),

    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Demo',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Fantastic 4',
      amount: 9.75,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Your Lists !"),
              SizedBox(height: 30),
              Expanded(child: ExpenseList(_registeredExpenses)),
            ],
          ),
        ),
      ),
    );
  }
}
