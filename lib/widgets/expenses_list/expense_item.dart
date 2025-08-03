import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.item, {super.key});
  Widget IconSelector(String cat) {
    if (cat == "Category.work") {
      return Icon(Icons.work);
    } else if (cat == "Category.leisure") {
      return Icon(Icons.tv);
    } else if (cat == "Category.fun") {
      return Icon(Icons.videogame_asset);
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
          children: [
            Text(item.title),
            SizedBox(height: 8),
            Row(
              children: [
                Text('\$${item.amount}'),
                Spacer(),
                Row(
                  children: [
                    IconSelector(item.category.toString()),
                    SizedBox(width: 5),
                    Text(item.date.toString()),
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
