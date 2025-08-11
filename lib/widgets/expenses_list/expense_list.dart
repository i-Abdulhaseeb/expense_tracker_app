import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.list, this.function1, {super.key});
  final List<Expense> list;
  final void Function(Expense exp) function1;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.centerRight, // Align text to swipe end
          padding: EdgeInsets.only(right: 20),
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
        key: ValueKey(list[index]),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          function1(list[index]);
        },
        child: ExpenseItem(list[index]),
      ),
    );
  }
}
