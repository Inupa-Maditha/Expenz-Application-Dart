import 'dart:convert';

import 'package:expence_app/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  static const String _incomeKey = 'income';
  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? getIcomesAsStringList = pref.getStringList(_incomeKey);
      List<Income> incomeList = [];
      if (getIcomesAsStringList != null) {
        incomeList = getIcomesAsStringList
            .map((e) => Income.fromJSON(json.decode(e)))
            .toList();
      }
      incomeList.add(income);
      List<String> updatedIncomeList = incomeList
          .map((e) => json.encode(e.toJSON()))
          .toList();
      await pref.setStringList(_incomeKey, updatedIncomeList);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Income Added Successfully"),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error saving income")));
      }
    }
  }

  Future<List<Income>> getIncome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? getIncomesAsStringList = pref.getStringList(_incomeKey);
    List<Income> incomeList = [];
    if (getIncomesAsStringList != null) {
      incomeList = getIncomesAsStringList
          .map((e) => Income.fromJSON(json.decode(e)))
          .toList();
    }
    return incomeList;
  }

  Future<void> deleteIncome(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? incomeListAsStringList = pref.getStringList(_incomeKey);
      List<Income> incomeAsObjectList = [];
      if (incomeListAsStringList != null) {
        incomeAsObjectList = incomeListAsStringList
            .map((e) => Income.fromJSON(json.decode(e)))
            .toList();
      }
      incomeAsObjectList.removeWhere((element) => element.id == id);
      List<String> updatedIncomeList = incomeAsObjectList
          .map((e) => json.encode(e.toJSON()))
          .toList();
      await pref.setStringList(_incomeKey, updatedIncomeList);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Successfully delete income"),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(duration: Duration(seconds: 1), content: Text("Income delete error")),
        );
      }
    }
  }

  static Future<void> daleteAllIncomes(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove(_incomeKey);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(duration: Duration(seconds: 1), content: Text("All Incomes Deleted")),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Error Deleting Incomes"),
          ),
        );
      }
    }
  }
}
