import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/models/expense_model.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:expence_app/services/expence_services.dart';
import 'package:expence_app/services/income_service.dart';
import 'package:expence_app/services/user_services.dart';
import 'package:expence_app/widgets/expence_card.dart';
import 'package:expence_app/widgets/income_expense_card.dart';
import 'package:expence_app/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenceList = [];
  List<Income> incomeList = [];

  String userName = "";
  double totalExpence = 0;
  double totalIncome = 0;

  Future<void> getItems() async {
    expenceList = await ExpenceServices().loadExpense();
    incomeList = await IncomeServices().getIncome();

    for (int i = 0; i < (expenceList.length); i++) {
      totalExpence += expenceList[i].amount;
    }
    for (int i = 0; i < (incomeList.length); i++) {
      totalIncome += incomeList[i].amount;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getItems();
    UserServices.getUserNameAndMail().then((value) {
      if (value['username'] != null) {
        setState(() {
          userName = value['username']!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //main column
        child: Column(
          children: [
            Container(
              //purpule container
              height: MediaQuery.of(context).size.height * 2 / 7,
              decoration: BoxDecoration(
                color: kLightPurpleColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
              ),
              child: SafeArea(
                //secondry column
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kWhiteColor,
                              border: Border.all(color: kMainColor, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(100),
                                child: Image.asset("assets/images/user.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(width: kDefaultPadding * 2),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome $userName",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.notifications, color: kMainColor, size: 30),
                                //Icons.notifications_active
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenseCard(
                            ammount: totalIncome,
                            bgColor: kGreenColor,
                            title: "Income",
                            imgUrl: "assets/images/income.png",
                          ),
                          IncomeExpenseCard(
                            ammount: totalExpence,
                            bgColor: kRedColor,
                            title: "Expenses",
                            imgUrl: "assets/images/expense.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spend Frequency",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: kDefaultPadding, width: double.infinity),
                  LineChartWidget(),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Recent transaction",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 36,
                          width: 84,
                          decoration: BoxDecoration(
                            color: kMainColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  (expenceList.isEmpty)
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
                            return ExpenceCard(
                              title: expenceList[index].title,
                              time: expenceList[index].time,
                              amount: expenceList[index].amount,
                              category: expenceList[index].category,
                              description: expenceList[index].description,
                            );
                          },
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
