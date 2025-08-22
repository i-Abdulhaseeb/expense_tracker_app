import 'package:expense_tracker_app/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

class Chart extends StatelessWidget {
  Chart(this.list1, {super.key});
  final List<Expense> list1;
  List<ExpenseBucket> get Buckets {
    return [
      ExpenseBucket.forCategory(list1, Category.food),
      ExpenseBucket.forCategory(list1, Category.leisure),
      ExpenseBucket.forCategory(list1, Category.work),
      ExpenseBucket.forCategory(list1, Category.travel),
    ];
  }

  double get maxtotalamount {
    double maxAmount = 0;
    for (final bucket in Buckets) {
      if (bucket.totalExpenses > maxAmount) {
        maxAmount = bucket.totalExpenses;
      }
    }
    return maxAmount;
  }

  IconData IconSelector(String cat) {
    if (cat == "Category.work") {
      return Icons.work;
    } else if (cat == "Category.leisure") {
      return Icons.tv;
    } else if (cat == "Category.food") {
      return Icons.fastfood_sharp;
    } else {
      return Icons.travel_explore;
    }
  }

  @override
  Widget build(context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in Buckets)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxtotalamount,
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: Buckets.map(
              (bucket) => Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Icon(
                    IconSelector(bucket.category.toString()),
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
