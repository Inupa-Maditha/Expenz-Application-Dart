import 'dart:convert';

import 'package:expence_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceServices {
  //expence list
  List<Expense> expencesList = [];

  //key for storing expences in shared preferences
  static const String _expencekey = 'expences';

  //save the expences to shared preferences
  Future<void> saveExpences(Expense expense, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpenses = pref.getStringList(_expencekey);

      List<Expense> existingExpenseObjects = [];

      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }

      existingExpenseObjects.add(expense);

      List<String> updatedExpenses = existingExpenseObjects
          .map((e) => json.encode(e.toJSON()))
          .toList();

      await pref.setStringList(_expencekey, updatedExpenses);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Expense Added Successfully"),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Error saving expense"),
          ),
        );
      }
    }
  }

  Future<List<Expense>> loadExpense() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String>? existingExpenses = pref.getStringList(_expencekey);
    List<Expense> loadedExpenses = [];
    if (existingExpenses != null) {
      loadedExpenses = existingExpenses
          .map((e) => Expense.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedExpenses;
  }

  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? listFromLocalStorage = pref.getStringList(_expencekey);
      List<Expense> expenceObjectList = [];
      if (listFromLocalStorage != null) {
        expenceObjectList = listFromLocalStorage
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }
      expenceObjectList.removeWhere((element) => element.id == id);
      List<String> updatedList = expenceObjectList
          .map((e) => json.encode(e.toJSON()))
          .toList();
      await pref.setStringList(_expencekey, updatedList);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Successfully delete expence"),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(duration: Duration(seconds: 1), content: Text("Expence delete error")),
        );
      }
    }
  }
}
