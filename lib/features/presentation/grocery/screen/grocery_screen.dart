import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/grocery/widgets/grocery_card.dart';
import 'package:restaurant_app/features/presentation/grocery/widgets/searchbox_for_grocery.dart';
import 'package:restaurant_app/features/presentation/grocery/widgets/smart_suggestion.dart';


class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),

            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.6.w),
              child: _header(),
            ),

            SizedBox(height: 4.0.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.6.w),
              child: const SearchBox(),
            ),

            SizedBox(height: 3.h),

            // Smart Suggestion Heading
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.6.w),
              child: Text(
                "Smart Suggestions",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // Horizontal Cards
            SizedBox(
              height: 16.4.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4.6.w),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const SmartSuggestionCard();
                },
              ),
            ),

            SizedBox(height: 2.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.6.w),
              child: Text(
                "Actual Grocery",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(10, 6, 21, 1),
                ),
              ),
            ),

            SizedBox(height: 2.h),

            // Vertical List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 4.6.w),
                children: const [
                  GroceryCard(
                    image: "assets/pantery_screen/spinach.png",
                    title: "Spinach",
                    subtitle: "1 bunch",
                  ),
                  GroceryCard(
                    image: "assets/pantery_screen/chicken_breast.png",
                    title: "Chicken Breast",
                    subtitle: "1 lb",
                  ),

                  GroceryCard(
                    image: "assets/pantery_screen/sweet potato.png",
                    title: "Sweet Potato",
                    subtitle: "1 lb",
                  ),

                  GroceryCard(
                    image: "assets/pantery_screen/brown_rice.png",
                    title: "Brown Rice",
                    subtitle: "1 lb",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _header() {
    return Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: const Icon(Icons.arrow_back_ios, size: 18),
        // ),
        // SizedBox(width: 3.w),
        Text(
          "Grocery List",
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
