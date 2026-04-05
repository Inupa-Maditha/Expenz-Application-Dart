import 'package:expence_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imgUrl, width: 300, fit: BoxFit.cover),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        Text(description, style: TextStyle(fontSize: 16, color: kGrayColor)),
      ],
    );
  }
}
