import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final DateTime time;
  final double amount;
  final IncomeCategory category;
  final String description;
  const IncomeCard({
    super.key,
    required this.title,
    required this.time,
    required this.amount,
    required this.category,
    required this.description,
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
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: kGrayColor.withValues(alpha: 0.6),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: incomeCategoryColor[category]!.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(incomeCategoryImages[category]!),
              ),
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
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "+\$${amount.toString()}",
                        style: TextStyle(fontSize: 20, color: kGreenColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          description,
                          style: TextStyle(
                            color: kGrayColor,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm a').format(time),
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
