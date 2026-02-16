import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/onboarding/presentation/widgets/custom_bottom_button_for_onboarding.dart';
import 'package:restaurant_app/features/onboarding/presentation/widgets/dob_step.dart';
import 'package:restaurant_app/features/onboarding/presentation/widgets/gender_step.dart';
import 'package:restaurant_app/features/onboarding/presentation/widgets/height_step.dart';

class OnboradingScreen3 extends StatefulWidget {
  const OnboradingScreen3({super.key});

  @override
  State<OnboradingScreen3> createState() => _OnboradingScreen3State();
}

class _OnboradingScreen3State extends State<OnboradingScreen3> {
  int currentStep = 0;
  final int totalSteps = 23;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      // Onboarding complete
      print("Onboarding Finished");
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  Widget buildStepContent() {
    switch (currentStep) {
      case 0:
        return GenderStep();

      case 1:
        return DateOfBirthStep();

      case 2:
        return HeightStep();

      default:
        return Center(child: Text("Step ${currentStep + 1}"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  /// Back Button
                  IconButton(
                    onPressed: previousStep,
                    icon: Image.asset(
                      "assets/auth/back arrow.png",
                      width: 8,
                      height: 12,
                    ),
                  ),
                  SizedBox(width: 6.w),

                  /// Progress Bar
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (currentStep + 1) / totalSteps,
                      backgroundColor: const Color.fromRGBO(209, 209, 209, 1),
                      color: Color.fromRGBO(0, 0, 0, 1),
                      borderRadius: BorderRadius.circular(50),
                      minHeight: 4,
                    ),
                  ),

                  SizedBox(width: 6.w),
                  Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color.fromRGBO(10, 6, 21, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.1.h),

              /// Dynamic Step Content
              Expanded(child: buildStepContent()),

              CustomBottomButtonForOnboarding(
                text: "Next",
                onTap: () {
                  nextStep();
                },
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
