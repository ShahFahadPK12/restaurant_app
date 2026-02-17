import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/custom_widget_button_for_onboarding.dart';


class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
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
                "assets/onboarding/onboarding_screen2.png",
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
              bottom: 4.8.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 4.6.w),
                child: Column(
                  children: [
                    Text(
                      "Personalized Nutrition",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 1.7.h),
                    Text(
                      textAlign: TextAlign.center,
                      "Your journey to healthier eating",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        // height: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.3.h),
                    Text(
                      textAlign: TextAlign.center,
                      "We'd like to know more about you to\nrecommend recipes tailored to your\nnutrition  goals and preferences.",
                      style: TextStyle(
                        fontSize: 17.sp,

                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.5.h),
                    CustomButtonForOnboarding(
                      text: "Get Started",
                      onTap: () {
                        Get.toNamed("/onboardingScreen3");
                      },
                      textColor: Colors.white,
                      bgcolor: Color.fromRGBO(31, 31, 31, 1),
                    ),
                    SizedBox(height: 2.6.h),
                    CustomButtonForOnboarding(
                      text: "Answer Later",
                      textColor: Colors.white,
                      bgcolor: Color.fromRGBO(112, 112, 112, 1),
                      onTap: () {},
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
