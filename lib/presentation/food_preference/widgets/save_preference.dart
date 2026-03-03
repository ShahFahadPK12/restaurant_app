import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SavePreferenceButton extends StatelessWidget {
  const SavePreferenceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.7.w, vertical: 1.7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Color.fromRGBO(31, 31, 31, 1),
      ),
      child: Center(
        child: Text(
          "Save Preferences",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}
