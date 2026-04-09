import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/screens/expense_report.dart';
import 'package:expence_app/screens/income_report.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    "Financial Report",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kGrayColor.withValues(alpha: 0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: (selectedTab == 0) ? kMainColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: (selectedTab == 0) ? kWhiteColor : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: (selectedTab == 1) ? kMainColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: (selectedTab == 1) ? kWhiteColor : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                (selectedTab == 0) ? ExpenseReport() : IncomeReport(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
