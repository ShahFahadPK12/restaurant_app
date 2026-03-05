import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodChip extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;

  const FoodChip({super.key, required this.text, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.4.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(31, 31, 31, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              height: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 1.w),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
