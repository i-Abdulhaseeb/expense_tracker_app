import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _showAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(addList),
    );
  }

  void addList(String t, String a, DateTime DateSelected) {
    setState(() {
      _registeredExpenses.add(
        Expense(
          title: t,
          amount: double.parse(a),
          date: DateSelected,
          category: Category.food,
        ),
      );
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showAddExpense, icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text("Your Lists !"),
            SizedBox(height: 30),
            Expanded(child: ExpenseList(_registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
