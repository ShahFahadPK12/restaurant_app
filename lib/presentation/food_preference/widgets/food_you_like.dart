import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/food_chip.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/search_box_for_food_preference.dart';
import 'package:restaurant_app/presentation/grocery/widgets/searchbox_for_grocery.dart';

class FoodYoulike extends StatelessWidget {
  const FoodYoulike({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.4.w, vertical: 1.9.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foods you like",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1,
              color: Color.fromRGBO(10, 6, 21, 1),
            ),
          ),

          SizedBox(height: 2.1.h),

          // Search
          const SearchBoxForFoodPreference(),

          SizedBox(height: 2.1.h),

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
                    style: TextStyle(
                      color: Color.fromRGBO(44, 44, 44, 1),
                      fontSize: 14.sp,
                    ),
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
