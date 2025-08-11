import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.item, {super.key});
  Widget IconSelector(String cat) {
    if (cat == "Category.work") {
      return Icon(Icons.work);
    } else if (cat == "Category.leisure") {
      return Icon(Icons.tv);
    } else if (cat == "Category.food") {
      return Icon(Icons.fastfood_sharp);
    } else {
      return Icon(Icons.travel_explore);
    }
  }

  final Expense item;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('\$${item.amount}'),
                Spacer(),
                Row(
                  children: [
                    IconSelector(item.category.toString()),
                    SizedBox(width: 5),
                    Text(item.formateDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
