import 'package:expence_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenceCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final ExpenseCategories categories;
  final String description;
  const ExpenceCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.categories,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
