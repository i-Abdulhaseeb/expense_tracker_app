import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:expense_tracker_app/chart/chart.dart';

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

  void addList(String t, String a, DateTime DateSelected, Category c1) {
    setState(() {
      _registeredExpenses.add(
        Expense(
          title: t,
          amount: double.parse(a),
          date: DateSelected,
          category: c1,
        ),
      );
      Chart(_registeredExpenses);
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
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showAddExpense, icon: Icon(Icons.add)),
        ],
      ),
      body: widthScreen < 500
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  if (_registeredExpenses.isNotEmpty)
                    Chart(_registeredExpenses),
                  SizedBox(height: 30),
                  Expanded(child: checker()),
                ],
              ),
            )
          : Row(
              children: [
                if (_registeredExpenses.isNotEmpty)
                  Expanded(child: Chart(_registeredExpenses)),

                Expanded(child: checker()),
              ],
            ),
    );
  }
}
