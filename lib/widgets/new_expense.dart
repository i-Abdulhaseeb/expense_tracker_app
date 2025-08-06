import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseEntered = '';
  DateTime? _currentDate;
  void saveExpense(String ans) {
    _expenseEntered = ans;
  }

  var _moneyWasted = 0;
  void saveMoneyWasted(String ans) {
    _moneyWasted = int.parse(ans);
  }

  void CalendarShow() async {
    final now = DateTime.now();
    final fDate = DateTime(now.year - 1, now.month, now.day);
    final selected_Date = await showDatePicker(
      context: context,
      firstDate: fDate,
      lastDate: now,
    );
    setState(() {
      _currentDate = selected_Date;
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: saveExpense,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text(
                "Enter title of expense",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: saveMoneyWasted,
                  maxLength: 5,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text("Enter Money wasted"),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _currentDate == null
                          ? 'No date Selected '
                          : formatter.format(_currentDate!),
                    ),
                    IconButton(
                      onPressed: CalendarShow,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text("Cancel"),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  print(_expenseEntered);
                  print(_moneyWasted);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
