import 'package:flutter/material.dart';

enum ExpenseCategories { food, transport, health, shopping, subscriptions }

final Map<ExpenseCategories, String> incomeCategoryImages = {
  ExpenseCategories.food: "assets/images/restaurant.png",
  ExpenseCategories.transport: "assets/images/car.png",
  ExpenseCategories.health: "assets/images/health.png",
  ExpenseCategories.shopping: "assets/images/bag.png",
  ExpenseCategories.subscriptions: "assets/images/bill.png",
};

final Map<ExpenseCategories, Color> incomeCategoryColor = {
  ExpenseCategories.food: Color(0xffE57373),
  ExpenseCategories.transport: Color(0xff81C784),
  ExpenseCategories.health: Color(0xff64B5F6),
  ExpenseCategories.shopping: Color(0xffFFD54F),
  ExpenseCategories.subscriptions: Color(0xff9575CD),
};

class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategories category;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.time,
    required this.description,
  });
}
