import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/custom_widget_button_for_onboarding.dart';


class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/onboarding/onboarding_screen1.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60.h,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(0, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 6.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 4.6.w),
                child: Column(
                  children: [
                    Text(
                      "Welcome to TasteTrail",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.1.h),
                    Text(
                      textAlign: TextAlign.center,
                      "Where our AI craft delicious recipies from what you have at home! ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        // height: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.5.h),
                    CustomButtonForOnboarding(
                      text: "Get Started",
                      onTap: () {
                        Get.toNamed("/onboardingScreen2");
                      },
                      textColor: Colors.white,
                      bgcolor: Color.fromRGBO(31, 31, 31, 1),
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
