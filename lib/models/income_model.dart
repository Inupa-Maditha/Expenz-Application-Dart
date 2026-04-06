import 'package:flutter/material.dart';

//income categories
enum IncomeCategory { freelance, salary, passive, sales }

//income category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.salary: "assets/images/health.png",
  IncomeCategory.passive: "assets/images/car.png",
  IncomeCategory.sales: "assets/images/salary.png",
};

//income category colors
final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.freelance: Color(0xffE57373),
  IncomeCategory.salary: Color(0xff81C784),
  IncomeCategory.passive: Color(0xff64B5F6),
  IncomeCategory.sales: Color(0xffFFD54F),
};

//income model
class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.time,
    required this.description,
  });
}
