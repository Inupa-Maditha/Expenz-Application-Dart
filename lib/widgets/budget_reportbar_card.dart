import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:flutter/material.dart';

class BudgetReportbarCard extends StatefulWidget {
  final int selectedTab;
  final Color categoryColor;
  final String categoryName;
  final double categoryTotal;
  final double allCategoriesTotal;
  const BudgetReportbarCard({
    super.key,
    required this.selectedTab,
    required this.categoryColor,
    required this.categoryName,
    required this.categoryTotal,
    required this.allCategoriesTotal,
  });

  @override
  State<BudgetReportbarCard> createState() => _BudgetReportbarCardState();
}

class _BudgetReportbarCardState extends State<BudgetReportbarCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: kGrayColor),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.7),
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.categoryColor,
                        ),
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text(
                        widget.categoryName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              (widget.selectedTab == 0)
                  ? Text(
                      "-\$${widget.categoryTotal.toInt().toString()}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: kRedColor,
                      ),
                    )
                  : Text(
                      "\$${widget.categoryTotal.toInt().toString()}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: kGreenColor,
                      ),
                    ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kGrayColor.withAlpha(60),
                ),
              ),
              Container(
                height: 10,
                width:
                    MediaQuery.of(context).size.width *
                    widget.categoryTotal /
                    widget.allCategoriesTotal,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: widget.categoryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
