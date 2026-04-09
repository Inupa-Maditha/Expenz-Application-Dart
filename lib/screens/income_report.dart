import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:expence_app/services/income_service.dart';
import 'package:expence_app/widgets/budget_reportbar_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeReport extends StatefulWidget {
  const IncomeReport({super.key});

  @override
  State<IncomeReport> createState() => _IncomeReportState();
}

class _IncomeReportState extends State<IncomeReport> {
  double total = 0;
  double totalFreelance = 0;
  double totalSalary = 0;
  double totalPassive = 0;
  double totalSales = 0;
  List<Income> listOfIncomes = [];

  Future<void> calculateIncomes() async {
    listOfIncomes = await IncomeServices().getIncome();

    for (int i = 0; (i < listOfIncomes.length); i++) {
      switch (listOfIncomes[i].category) {
        case IncomeCategory.freelance:
          totalFreelance += listOfIncomes[i].amount;
          break;
        case IncomeCategory.salary:
          totalSalary += listOfIncomes[i].amount;
          break;
        case IncomeCategory.passive:
          totalPassive += listOfIncomes[i].amount;
          break;
        case IncomeCategory.sales:
          totalSales += listOfIncomes[i].amount;
          break;
      }
    }

    total = totalFreelance + totalSalary + totalPassive + totalSales;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    calculateIncomes();
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
                                color: incomeCategoryColor[IncomeCategory.freelance],
                                value: totalFreelance,
                                radius: 40,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: incomeCategoryColor[IncomeCategory.salary],
                                value: totalSalary,
                                radius: 40,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: incomeCategoryColor[IncomeCategory.passive],
                                value: totalPassive,
                                radius: 40,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: incomeCategoryColor[IncomeCategory.sales],
                                value: totalSales,
                                radius: 40,
                                showTitle: false,
                              ),
                            ],
                            centerSpaceRadius: 80,
                            sectionsSpace: 0,
                            startDegreeOffset: -90,
                            centerSpaceColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        BudgetReportbarCard(
          selectedTab: 1,
          categoryColor: incomeCategoryColor[IncomeCategory.freelance]!,
          categoryName: 'Freelance',
          categoryTotal: totalFreelance,
          allCategoriesTotal: total,
        ),
        BudgetReportbarCard(
          selectedTab: 1,
          categoryColor: incomeCategoryColor[IncomeCategory.salary]!,
          categoryName: 'Salary',
          categoryTotal: totalSalary,
          allCategoriesTotal: total,
        ),
        BudgetReportbarCard(
          selectedTab: 1,
          categoryColor: incomeCategoryColor[IncomeCategory.passive]!,
          categoryName: 'Passive',
          categoryTotal: totalPassive,
          allCategoriesTotal: total,
        ),
        BudgetReportbarCard(
          selectedTab: 1,
          categoryColor: incomeCategoryColor[IncomeCategory.sales]!,
          categoryName: 'Sales',
          categoryTotal: totalSales,
          allCategoriesTotal: total,
        ),
      ],
    );
  }
}
