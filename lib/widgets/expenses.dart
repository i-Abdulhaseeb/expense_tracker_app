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
      isScrollControlled: true,
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

  void deleteExpense(Expense exp) {
    int index = _registeredExpenses.indexOf(exp);
    setState(() {
      _registeredExpenses.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(index, exp);
            });
          },
        ),
      ),
    );
  }

  Widget checker() {
    if (_registeredExpenses.isEmpty) {
      return Center(child: Text("No Expense Found , Enter Some Expense"));
    } else {
      return ExpenseList(_registeredExpenses, deleteExpense);
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showAddExpense, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text("Your Lists !"),
            SizedBox(height: 30),
            Expanded(child: checker()),
          ],
        ),
      ),
    );
  }
}
