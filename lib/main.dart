import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Expenses(), // <- This should just be a screen
    );
  }
}
