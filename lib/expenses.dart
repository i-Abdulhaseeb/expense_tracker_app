import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

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
              ElevatedButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(_registeredExpenses[0].id),
                        SizedBox(width: 5),
                        Text(_registeredExpenses[0].title),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(_registeredExpenses[0].category.toString()),
                        SizedBox(width: 5),
                        Text(_registeredExpenses[0].amount.toString()),
                        SizedBox(width: 10),
                        Text(_registeredExpenses[0].date.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
