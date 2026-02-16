import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButtonForOnboarding extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  final Color bgcolor;

  const CustomButtonForOnboarding({
    super.key,
    this.bgcolor = Colors.black,
    this.textColor = Colors.white,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            height: 1,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
