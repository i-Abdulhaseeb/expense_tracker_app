import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseEntered = '';
  void saveExpense(String ans) {
    _expenseEntered = ans;
  }

  var _moneyWasted = 0;
  void saveMoneyWasted(String ans) {
    _moneyWasted = int.parse(ans);
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
          TextField(
            onChanged: saveMoneyWasted,
            maxLength: 5,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: Text("Enter Money wasted")),
          ),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {},
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
