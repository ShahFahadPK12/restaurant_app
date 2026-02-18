import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NutritionBox extends StatelessWidget {
  final String title;
  final double percentage;
  final String unit;

  const NutritionBox({
    super.key,
    required this.title,
    required this.percentage,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // height: 10.7.h,
          width: 23.2.w,
          padding: EdgeInsets.symmetric(vertical: 1.1.h),
          decoration: BoxDecoration(
            color: Color.fromRGBO(31, 31, 31, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 0.8.h),
              Container(
                height: 6.0.h,
                width: 13.0.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 6.0.h,
                      width: 13.0.w,
                      child: CircularProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: const Color.fromRGBO(94, 94, 94, 1),
                        color: Color.fromRGBO(216, 216, 216, 1),
                        strokeWidth: 4,
                      ),
                    ),
                    Text(
                      "${percentage.toInt()}%\n$unit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
