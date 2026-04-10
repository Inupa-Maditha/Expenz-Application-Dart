import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/screens/onboarding/onboarding_screen.dart';
import 'package:expence_app/services/expence_services.dart';
import 'package:expence_app/services/income_service.dart';
import 'package:expence_app/services/user_services.dart';
import 'package:flutter/material.dart';

class ProfilepageOperationCard extends StatefulWidget {
  final int index;
  static const length = 4;
  const ProfilepageOperationCard({super.key, required this.index});

  @override
  State<ProfilepageOperationCard> createState() => _ProfilepageOperationCardState();
}

class _ProfilepageOperationCardState extends State<ProfilepageOperationCard> {
  final Map<int, String> oparationName = {
    0: 'My Wallet',
    1: 'Setting',
    2: 'Export Data',
    3: 'Log Out',
  };
  final Map<int, IconData> oparationIcon = {
    0: Icons.wallet,
    1: Icons.settings,
    2: Icons.file_download_outlined,
    3: Icons.logout,
  };
  final Map<int, Color> oparationIconColor = {
    0: kMainColor,
    1: kMainColor,
    2: kMainColor,
    3: kRedColor,
  };
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kLightBlue,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Are you sure want to logout?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await UserServices.deleteUser();
                      if (context.mounted) {
                        await ExpenceServices.daleteAllExpences(context);
                        await IncomeServices.daleteAllIncomes(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => OnboardingScreen()),
                          (route) => false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kRedColor),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontWeight: FontWeight.bold, color: kWhiteColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kGreenColor),
                    child: Text(
                      "No",
                      style: TextStyle(fontWeight: FontWeight.bold, color: kWhiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: kGrayColor, blurRadius: 3, blurStyle: BlurStyle.outer),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.index == 3) {
            _showBottomSheet(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: oparationIconColor[widget.index]!.withValues(alpha: 0.2),
                ),
                child: Center(
                  child: Icon(
                    oparationIcon[widget.index],
                    size: 30,
                    color: oparationIconColor[widget.index],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              Text(
                oparationName[widget.index]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
