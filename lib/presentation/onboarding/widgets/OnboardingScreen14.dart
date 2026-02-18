import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen14 extends StatefulWidget {
  const OnboardingScreen14({super.key});

  @override
  State<OnboardingScreen14> createState() => _OnboardingScreen14State();
}

class _OnboardingScreen14State extends State<OnboardingScreen14> {
  String selectedOption = "I manage my stress well, no particular issue";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          "What is your daily stress level?",
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

        SizedBox(height: 13.9.h),

        /// OPTIONS
        _buildOption("I manage my stress well, no particular issue"),

        SizedBox(height: 1.7.h),

        _buildOption("Moderate stress (some tension but generally stable)"),

        SizedBox(height: 1.7.h),

        _buildOption("I work night shifts or have an irregular schedule"),
        SizedBox(height: 1.7.h),
        _buildOption("High or chronic stress"),
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
