import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/food_chip.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/search_box_for_food_preference.dart';

class FoodYouAvoid extends StatelessWidget {
  const FoodYouAvoid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foods you like",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 1.h),

          // Search
          const SearchBoxForFoodPreference(),

          SizedBox(height: 1.h),

          Wrap(
            children: [
              FoodChip(text: "Avocado", onTap: () {}),
              FoodChip(text: "Salmon", onTap: () {}),
              FoodChip(text: "Sweet Potato", onTap: () {}),
              GestureDetector(
                onTap: () => _showFoodPopup(context),
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Text(
                    "View More",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFoodPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          height: 50.h,
          padding: EdgeInsets.all(4.w),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Food Item ${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: index == 4 ? 18.sp : 14.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
