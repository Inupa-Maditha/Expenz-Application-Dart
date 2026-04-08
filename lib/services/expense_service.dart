// import 'dart:convert';

// import 'package:expence_app/models/expense_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ExpenseService {
//   static const String _expencekey = 'expense';
//   Future<void> saveExpences(Expense expence, BuildContext context) async {
//     try {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       List<String>? getExpecesAsStringList = pref.getStringList(_expencekey);
//       List<Expense> expenceList = [];
//       if (getExpecesAsStringList != null) {
//         expenceList = getExpecesAsStringList
//             .map((e) => Expense.fromJSON(json.decode(e)))
//             .toList();
//       }
//       expenceList.add(expence);
//       List<String> encodedExpenseList = expenceList
//           .map((e) => json.encode(e.toJSON()))
//           .toList();
//       await pref.setStringList(_expencekey, encodedExpenseList);
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(duration: Duration(seconds: 1), content: Text("Successfully added")),
//         );
//       }
//     } catch (error) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(duration: Duration(seconds: 1), content: Text("Can't add Expense")),
//         );
//       }
//     }
//   }

//   Future<List<Expense>> getExpences() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String>? getExpencesAsStringList = pref.getStringList(_expencekey);
//     List<Expense> expenceList = [];
//     if (getExpencesAsStringList != null) {
//       expenceList = getExpencesAsStringList
//           .map((e) => Expense.fromJSON(json.decode(e)))
//           .toList();
//     }
//     return expenceList;
//   }
// }
