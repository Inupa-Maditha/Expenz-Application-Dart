import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/services/user_services.dart';
import 'package:expence_app/widgets/income_expense_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";

  @override
  void initState() {
    UserServices.getUserNameAndMail().then((value) {
      if (value['username'] != null) {
        setState(() {
          userName = value['username']!;
        });
      }
    });
    super.initState();
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
                            ammount: 5000,
                            bgColor: kGreenColor,
                            title: "Income",
                            imgUrl: "assets/images/income.png",
                          ),
                          IncomeExpenseCard(
                            ammount: 1200,
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
              child: Column(children: [Container(color: kBlackColor, height: 20)]),
            ),
          ],
        ),
      ),
    );
  }
}
