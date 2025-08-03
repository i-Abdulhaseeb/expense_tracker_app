import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.list, {super.key});
  final List<Expense> list;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) => ExpenseItem(list[index]),
    );
  }
}
