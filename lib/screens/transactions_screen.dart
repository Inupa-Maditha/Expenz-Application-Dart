import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/models/expense_model.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:expence_app/services/expence_services.dart';
import 'package:expence_app/services/income_service.dart';
import 'package:expence_app/widgets/expence_card.dart';
import 'package:expence_app/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Expense> expenceList = [];
  List<Income> incomeList = [];

  Future<void> getList() async {
    expenceList = await ExpenceServices().loadExpense();
    incomeList = await IncomeServices().getIncome();
    setState(() {});
  }

  Future<void> deleteExpence(int id) async {
    await ExpenceServices().deleteExpense(id, context);
    await getList();
  }

  Future<void> deleteIncone(int id) async {
    await IncomeServices().deleteIncome(id, context);
    await getList();
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kDefaultPadding),
                Text(
                  "See your financial report",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5),
                  child: Text(
                    "Expenses",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      child: (expenceList.isEmpty)
                          ? Padding(
                              padding: EdgeInsets.only(top: kDefaultPadding * 2),
                              child: Text(
                                "No Expences Added Yet, Add Some Expences To See Here.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, color: kGrayColor),
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: expenceList.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: ValueKey(expenceList[index]),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) =>
                                      deleteExpence(expenceList[index].id),
                                  child: ExpenceCard(
                                    amount: expenceList[index].amount,
                                    description: expenceList[index].description,
                                    title: expenceList[index].title,
                                    category: expenceList[index].category,
                                    time: expenceList[index].time,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5),
                  child: Text(
                    "Income",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: SingleChildScrollView(
                    child: (incomeList.isEmpty)
                        ? Padding(
                            padding: EdgeInsets.only(top: kDefaultPadding * 2),
                            child: Text(
                              "No Incomes Added Yet, Add Some Incomes To See Here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: kGrayColor),
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: incomeList.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: ValueKey(incomeList[index].id),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  deleteIncone(incomeList[index].id);
                                },
                                child: IncomeCard(
                                  amount: incomeList[index].amount,
                                  category: incomeList[index].category,
                                  description: incomeList[index].description,
                                  time: incomeList[index].time,
                                  title: incomeList[index].title,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
