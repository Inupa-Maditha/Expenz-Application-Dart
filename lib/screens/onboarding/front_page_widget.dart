import 'package:expence_app/constants/colors.dart';
import 'package:flutter/material.dart';

class FrontPageWidget extends StatelessWidget {
  const FrontPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", width: 150, fit: BoxFit.contain),
        SizedBox(height: 20),
        Text(
          "Expense",
          style: TextStyle(fontSize: 40, color: kMainColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
