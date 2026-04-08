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
}
