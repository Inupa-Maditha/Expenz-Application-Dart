import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedmethode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (_selectedmethode == 0) ? kRedColor : kGreenColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedmethode = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (_selectedmethode == 0)
                                  ? kMainColor
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (_selectedmethode == 0)
                                      ? kWhiteColor
                                      : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedmethode = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (_selectedmethode == 1)
                                  ? kMainColor
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (_selectedmethode == 1)
                                      ? kWhiteColor
                                      : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
