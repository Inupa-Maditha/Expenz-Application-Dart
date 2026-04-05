import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enter your personal details",
                style: TextStyle(
                  fontSize: 44,
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember Me for the next time",
                    style: TextStyle(fontSize: 18, color: kGrayColor),
                  ),
                  Icon(Icons.toggle_off, size: 50, color: kMainColor),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              CustomButton(buttonName: "Next", buttonColor: kMainColor),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
