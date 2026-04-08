import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  // final String title;
  // final DateTime date;
  // final double amount;
  // final ExpenseCategories category;
  // final String description;
  const IncomeCard({
    super.key,
    // required this.title,
    // required this.date,
    // required this.amount,
    // required this.category,
    // required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding * 1.2, bottom: kDefaultPadding),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kGrayColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: incomeCategoryColor[IncomeCategory.salary]!.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: Image.asset(incomeCategoryImages[IncomeCategory.salary]!),
            ),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shopping",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("+\$120", style: TextStyle(fontSize: 20, color: kGreenColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buy Some Grocery",
                        style: TextStyle(color: kGrayColor, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "10:00 AM",
                        style: TextStyle(color: kGrayColor, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
