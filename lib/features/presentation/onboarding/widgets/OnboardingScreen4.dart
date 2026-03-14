import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose your gender",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(31, 31, 31, 1),
          ),
        ),
        SizedBox(height: 1.9.h),
        Text(
          "Choose 1 option",
          style: TextStyle(
            color: Color.fromRGBO(112, 112, 112, 1),
            height: 1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 31.h),

        Row(
          children: [
            /// MALE BUTTON
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = "Male";
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.9.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: selectedGender == "Male"
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedGender == "Male") ...[
                      const Icon(Icons.check, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      "Male".toUpperCase(),
                      style: TextStyle(
                        color: selectedGender == "Male"
                            ? Colors.white
                            : Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// FEMALE BUTTON
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = "Female";
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.9.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: selectedGender == "Female"
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedGender == "Female") ...[
                      const Icon(Icons.check, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      "Female".toUpperCase(),
                      style: TextStyle(
                        color: selectedGender == "Female"
                            ? Colors.white
                            : Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
