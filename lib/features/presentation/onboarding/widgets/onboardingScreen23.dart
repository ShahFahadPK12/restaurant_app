import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';

class Onboardingscreen23 extends StatefulWidget {
  const Onboardingscreen23({super.key});

  @override
  State<Onboardingscreen23> createState() => _Onboardingscreen23State();
}

class _Onboardingscreen23State extends State<Onboardingscreen23> {
  String? selectedOption;
  // Shared validation controller (created in OnboradingScreen3).
  final OnboardingValidationController _validationController =
      Get.find<OnboardingValidationController>();
  @override
  void initState() {
    super.initState();
    // Roman Urdu: agar pehle se selection ho to wapas show kar do.
    selectedOption = _validationController.supplements.value;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            "Do you take dietary supplements? If yes, which ones?",
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

          SizedBox(height: 10.3.h),

          /// OPTIONS
          _buildOption("No"),

          SizedBox(height: 1.7.h),

          _buildOption("Multivitamins"),
          SizedBox(height: 1.7.h),
          _buildOption("Protein powders (whey, plant-based, casein, etc.)"),
          SizedBox(height: 1.7.h),
          _buildOption("Omega-3 (EPA/DHA)"),
          SizedBox(height: 1.7.h),
          _buildOption("Creatine"),
          SizedBox(height: 1.7.h),
          _buildOption("Magnesium"),
          SizedBox(height: 1.7.h),
          _buildOption("Vitamin D"),
          SizedBox(height: 9.6.h),
        ],
      ),
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
        _validationController.supplements.value = text;
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
