import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/data/onboarding_model_data.dart';
import 'package:expence_app/screens/onboarding/front_page_widget.dart';
import 'package:expence_app/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expence_app/screens/onboarding/user_data_screen.dart';
import 'package:expence_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final data = OnboardingModelData();
  bool isLastPage = false;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        isLastPage = value == 3;
                      });
                    },
                    children: [
                      const FrontPageWidget(),
                      SharedOnboardingScreen(
                        title: data.onboardingModelData[0].title,
                        description: data.onboardingModelData[0].description,
                        imgUrl: data.onboardingModelData[0].imageUrl,
                      ),
                      SharedOnboardingScreen(
                        title: data.onboardingModelData[1].title,
                        description: data.onboardingModelData[1].description,
                        imgUrl: data.onboardingModelData[1].imageUrl,
                      ),
                      SharedOnboardingScreen(
                        title: data.onboardingModelData[2].title,
                        description: data.onboardingModelData[2].description,
                        imgUrl: data.onboardingModelData[2].imageUrl,
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment(0, 0.62),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kLightGrayColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.08,
                    child: InkWell(
                      onTap: () {
                        if (!isLastPage) {
                          _controller.animateToPage(
                            _controller.page!.toInt() + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserDataScreen()),
                          );
                        }
                      },
                      child: CustomButton(
                        buttonName: isLastPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                        width: (MediaQuery.of(context).size.width - kDefaultPadding * 2),
                      ),
                    ),
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
