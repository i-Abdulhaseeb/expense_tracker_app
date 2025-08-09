import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/model/expense.dart';

class NewExpense extends StatefulWidget {
  NewExpense(this.function1, {super.key});
  final void Function(String, String, DateTime) function1;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  void submission() {
    if (_expenseEntered.trim().isEmpty ||
        _moneyWasted == 0.0 ||
        _moneyWasted! <= 0 ||
        _currentDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Inavlid Input"),
          content: Text("Submit a valid title , amount , category or Date"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
    } else {
      widget.function1(_expenseEntered, _moneyWasted.toString(), _currentDate!);
      Navigator.pop(context);
    }
  }

  var _expenseEntered = '';
  DateTime? _currentDate;
  Category _selectedCategory = Category.leisure;
  void saveExpense(String ans) {
    _expenseEntered = ans;
  }

  double? _moneyWasted;
  void saveMoneyWasted(String ans) {
    _moneyWasted = double.tryParse(ans) ?? 0.0;
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
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
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
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  } else {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
              ),
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
                  submission();
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
