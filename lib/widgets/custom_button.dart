import 'package:expence_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final double? width;
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 1,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
