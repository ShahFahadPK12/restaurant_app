import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen14.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen15.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen6.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen8.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen9.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen12.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/custom_bottom_button_for_onboarding.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen5.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen4.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen10.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen13.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen11.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/OnboardingScreen7.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/custom_widget_button_for_onboarding.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen16.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen17.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen18.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen19.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen20.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen21.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen22.dart';
import 'package:restaurant_app/presentation/onboarding/widgets/onboardingScreen23.dart';

class OnboradingScreen3 extends StatefulWidget {
  const OnboradingScreen3({super.key});

  @override
  State<OnboradingScreen3> createState() => _OnboradingScreen3State();
}

class _OnboradingScreen3State extends State<OnboradingScreen3> {
  int currentStep = 0;
  final int totalSteps = 19;

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

  void showCompletionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const CompletionBottomSheet();
      },
    );
  }

  Widget buildStepContent() {
    switch (currentStep) {
      case 0:
        return OnboardingScreen4();

      case 1:
        return OnboardingScreen5();

      case 2:
        return OnboardingScreen6();

      case 3:
        return OnboardingScreen7();

      case 4:
        return OnboardingScreen8();

      case 5:
        return OnboardingScreen9();

      case 6:
        return OnboardingScreen10();

      case 7:
        return OnboardingScreen11();

      case 8:
        return OnboardingScreen12();

      case 9:
        return OnboardingScreen13();

      case 10:
        return OnboardingScreen14();

      case 11:
        return OnboardingScreen15();
      case 12:
        return Onboardingscreen16();

      case 13:
        return OnboardingScreen17();
      case 14:
        return OnboardingScreen18();

      case 15:
        return Onboardingscreen19();

      case 16:
        return Onboardingscreen20();
      case 17:
        return Onboardingscreen21();

      case 18:
        return Onboardingscreen22();

      case 19:
        return Onboardingscreen23();

      default:
        return SizedBox(); //Center(child: Text("Step ${currentStep + 1}"));
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
                  // IconButton(
                  //   onPressed: previousStep,
                  //   icon: Image.asset(
                  //     "assets/auth/back arrow.png",
                  //     width: 8,
                  //     height: 12,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: previousStep,
                    child: Image.asset(
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
                  if (currentStep == totalSteps - 1) {
                    showCompletionBottomSheet(context);
                  } else {
                    nextStep();
                  }
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

class CompletionBottomSheet extends StatelessWidget {
  const CompletionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// 🔹 Close Button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const Spacer(),

              /// 🔹 Big Check Icon
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 58),
              ),

              const SizedBox(height: 25),

              /// 🔹 Message Text
              Text(
                "Everything is set up. Let’s head up\n to the home screen.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),

              const Spacer(),

              /// 🔹 Go to Dashboard Button
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     onPressed: () {
              //       // Close bottom sheet
              //       Navigator.pop(context);

              //       // Navigate to Dashboard
              //       Navigator.pushReplacementNamed(context, "/dashboard");
              //     },
              //     child: const Text(
              //       "Go to Dashboard",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              // CustomBottomButtonForOnboarding(
              //   text: "Go to Dashboard",
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushReplacementNamed(context, "/dashboard");
              //   },
              // ),
              CustomButtonForOnboarding(
                text: "Go to Dashboard",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed("/home");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
