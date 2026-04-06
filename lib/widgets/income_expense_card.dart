import 'package:expence_app/constants/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatefulWidget {
  final String title;
  final String imgUrl;
  final Color bgColor;
  final double ammount;
  const IncomeExpenseCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.bgColor,
    required this.ammount,
  });

  @override
  State<IncomeExpenseCard> createState() => _IncomeExpenseCardState();
}

class _IncomeExpenseCardState extends State<IncomeExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65 / 7,
      width: MediaQuery.of(context).size.width * 0.445,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Image.asset(widget.imgUrl, fit: BoxFit.scaleDown),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(color: kWhiteColor, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\$${widget.ammount.toInt().toString()}",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
