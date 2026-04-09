import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/models/expense_model.dart';
import 'package:expence_app/services/expence_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseReport extends StatefulWidget {
  const ExpenseReport({super.key});

  @override
  State<ExpenseReport> createState() => _ExpenseReportState();
}

class _ExpenseReportState extends State<ExpenseReport> {
  double total = 0;
  double totalFood = 0;
  double totalTransport = 0;
  double totalHealth = 0;
  double totalShopping = 0;
  double totalSubscriptions = 0;
  List<Expense> listOfExpences = [];

  Future<void> calculateExpences() async {
    listOfExpences = await ExpenceServices().loadExpense();

    for (int i = 0; (i < listOfExpences.length); i++) {
      switch (listOfExpences[i].category) {
        case ExpenseCategories.food:
          totalFood += listOfExpences[i].amount;
          break;
        case ExpenseCategories.transport:
          totalTransport += listOfExpences[i].amount;
          break;
        case ExpenseCategories.health:
          totalHealth += listOfExpences[i].amount;
          break;
        case ExpenseCategories.shopping:
          totalShopping += listOfExpences[i].amount;
          break;
        case ExpenseCategories.subscriptions:
          totalSubscriptions += listOfExpences[i].amount;
          break;
      }
    }

    total = totalFood + totalTransport + totalHealth + totalShopping + totalSubscriptions;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    calculateExpences();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          width: double.infinity,
          child: Center(
            child: (total == 0)
                ? Center(
                    child: Text(
                      "No Data To Show",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kGrayColor,
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Center(
                        child: Text(
                          "\$${total.toInt().toString()}",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: PieChart(
                          PieChartData(
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(width: 20, color: kMainColor),
                            ),
                            sections: [
                              PieChartSectionData(
                                color: expenseCategoryColor[ExpenseCategories.food],
                                value: totalFood,
                                radius: 20,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: expenseCategoryColor[ExpenseCategories.transport],
                                value: totalTransport,
                                radius: 20,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: expenseCategoryColor[ExpenseCategories.health],
                                value: totalHealth,
                                radius: 20,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: expenseCategoryColor[ExpenseCategories.shopping],
                                value: totalShopping,
                                radius: 20,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color:
                                    expenseCategoryColor[ExpenseCategories.subscriptions],
                                value: totalSubscriptions,
                                radius: 20,
                                showTitle: false,
                              ),
                            ],
                            centerSpaceRadius: 80,
                            sectionsSpace: 0,
                            startDegreeOffset: 0,
                            centerSpaceColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
