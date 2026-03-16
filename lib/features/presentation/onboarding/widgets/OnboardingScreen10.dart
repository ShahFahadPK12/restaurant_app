import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';

class OnboardingScreen10 extends StatefulWidget {
  const OnboardingScreen10({super.key});

  @override
  State<OnboardingScreen10> createState() => _OnboardingScreen10State();
}

class _OnboardingScreen10State extends State<OnboardingScreen10> {
  String? selectedOption;
  // Shared validation controller (created in OnboradingScreen3).
  final OnboardingValidationController _validationController =
      Get.find<OnboardingValidationController>();

  @override
  void initState() {
    super.initState();
    // Roman Urdu: agar pehle se selection ho to wapas show kar do.
    selectedOption = _validationController.primaryGoal.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          "What is your primary goal?",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(31, 31, 31, 1),
          ),
        ),

        SizedBox(height: 1.5.h),

        /// SUBTITLE
        Text(
          "Select Choice",
          style: TextStyle(
            color: Color.fromRGBO(112, 112, 112, 1),
            height: 1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 22.1.h),

        /// OPTIONS
        _buildOption("Improve athletic performance"),

        SizedBox(height: 1.7.h),

        _buildOption(
          "Physical transformation (fat loss, muscle gain, body recomposition)",
        ),

        SizedBox(height: 1.7.h),

        _buildOption("General health & well-being"),
      ],
    );
  }

  Widget _buildOption(String text) {
    bool isSelected = selectedOption == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
        });
        // Roman Urdu: user ki selection save kar rahe hain.
        _validationController.primaryGoal.value = text;
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.black
              : const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Tick Icon
            if (isSelected) ...[
              const Icon(Icons.check, color: Colors.white, size: 20),
              SizedBox(width: 2.w),
            ],

            /// Text
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isSelected
                      ? Colors.white
                      : Color.fromRGBO(112, 112, 112, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
