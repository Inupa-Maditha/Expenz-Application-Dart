import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> storeUserDetail({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password and Confirm password are not matched")),
      );
    } else if (password == confirmPassword) {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("username", username);
        await pref.setString("email", email);

        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text("User details stored successfully")));
      } catch (err) {
        err.toString();
      }
    }
  }
}
