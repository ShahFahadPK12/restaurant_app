import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/food_you_avoid.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/food_you_like.dart';
import 'package:restaurant_app/presentation/grocery/widgets/searchbox_for_grocery.dart';

class FoodPreferenceScreen extends StatelessWidget {
  const FoodPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),

              // Header
              _header(),

              SizedBox(height: 4.0.h),

              FoodYoulike(),

              SizedBox(height: 3.5.h),
              FoodYouAvoid(),
              SizedBox(height: 2.h),

              // Vertical List
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _header() {
    return Row(
      children: [
        Text(
          "Food Preference",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Color.fromRGBO(10, 6, 21, 1),
          ),
        ),
      ],
    );
  }
}
