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
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  factory Income.fromJSON(Map<String, dynamic> json) {
    return Income(
      id: json['id'],
      title: json['title'].toString(),
      amount: json['amount'],
      category: IncomeCategory.values[json['category']],
      date: DateTime(json['date']),
      time: DateTime(json['time']),
      description: json['title'].toString(),
    );
  }
}
