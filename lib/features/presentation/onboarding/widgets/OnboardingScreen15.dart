import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

class OnboardingScreen15 extends StatefulWidget {
  const OnboardingScreen15({super.key});

  @override
  State<OnboardingScreen15> createState() => _OnboardingScreen15State();
}

class _OnboardingScreen15State extends State<OnboardingScreen15> {
  String selectedOption = "Testosterone deficiency";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            "Are you at risk for any of the following conditions?",
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

          SizedBox(height: 10.0.h),

          /// OPTIONS
          _buildOption("Testosterone deficiency"),

          SizedBox(height: 1.7.h),

          _buildOption("Heart disease or stroke"),

          SizedBox(height: 1.7.h),

          _buildOption("High blood pressure (Hypertension)"),
          SizedBox(height: 1.7.h),
          _buildOption("Diabetes or insulin resistance"),
          SizedBox(height: 1.7.h),
          _buildOption("High cholesterol"),
          SizedBox(height: 1.7.h),
          _buildOption("Depression or mood disorders"),
          SizedBox(height: 1.7.h),
          _buildOption("No identified risk"),
          SizedBox(height: 9.5.h),
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
