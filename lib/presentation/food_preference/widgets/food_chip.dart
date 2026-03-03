import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodChip extends StatelessWidget {
  final String text;
  VoidCallback onTap;
  FoodChip({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w, bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.6.h),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
          ),
          SizedBox(width: 0.5.w),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.close, color: Colors.white, size: 12),
          ),
        ],
      ),
    );
  }
}
