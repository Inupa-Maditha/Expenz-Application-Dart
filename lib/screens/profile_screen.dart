import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/services/user_services.dart';
import 'package:expence_app/widgets/profilepage_operation_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String> userData = {};

  Future<void> getUserData() async {
    userData = await UserServices.getUserNameAndMail();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              SizedBox(height: kDefaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (userData['username'] != null)
                              Text(
                                "Welcome ${userData['username']}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (userData['email'] != null)
                              Text(
                                userData['email']!,
                                style: TextStyle(fontSize: 14, color: kGrayColor),
                              ),
                          ],
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kMainColor.withAlpha(60),
                          ),

                          child: Icon(Icons.edit, color: kMainColor, size: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: kDefaultPadding * 6),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ProfilepageOperationCard.length,
                scrollDirection: Axis.vertical,

                itemBuilder: (context, index) {
                  return ProfilepageOperationCard(index: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
