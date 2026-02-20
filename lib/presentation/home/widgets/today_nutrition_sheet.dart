

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/home/widgets/MealTile.dart';
import 'package:restaurant_app/presentation/home/widgets/nutritions_box.dart';

class TodayNutritionSheet extends StatefulWidget {
  const TodayNutritionSheet({super.key});

  @override
  State<TodayNutritionSheet> createState() => _TodayNutritionSheetState();
}

class _TodayNutritionSheetState extends State<TodayNutritionSheet> {
  int selectedIndex = -1;

  // final List<String> meals = ["Breakfast", "Lunch", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.symmetric(vertical: 2.14.h, horizontal: 4.6.w),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: const Color.fromRGBO(229, 233, 239, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Nutrition",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 2.2,
                          color: const Color.fromRGBO(31, 31, 31, 1),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 24),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.7.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Summary",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: const Color.fromRGBO(31, 31, 31, 1),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.4.w,
                          vertical: 0.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(10, 6, 21, 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "1850 / 2000 kcal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 1.3.h),

                  LinearProgressIndicator(
                    value: 0.85,
                    minHeight: 8,
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                    color: const Color.fromRGBO(112, 112, 112, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  SizedBox(height: 1.8.h),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NutritionBox(
                        title: "Protein",
                        percentage: 65,
                        unit: "120g",
                      ),
                      NutritionBox(
                        title: "Carbs",
                        percentage: 80,
                        unit: "200g",
                      ),
                      NutritionBox(
                        title: "Lipids",
                        percentage: 40,
                        unit: "50g",
                      ),
                    ],
                  ),

                  SizedBox(height: 3.2.h),

                  /// Meals Title
                  Text(
                    "Meals",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(31, 31, 31, 1),
                    ),
                  ),

                  SizedBox(height: 2.14.h),

                  Padding(
                    padding: EdgeInsets.only(bottom: 2.14.h),
                    child: MealTile(
                      title: "Breakfast",
                      isExpanded: selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          if (selectedIndex == 0) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = 0;
                          }
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 2.14.h),
                    child: MealTile(
                      title: "Lunch",
                      isExpanded: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          if (selectedIndex == 1) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = 1;
                          }
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 2.14.h),
                    child: MealTile(
                      title: "Dinner",
                      isExpanded: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          if (selectedIndex == 2) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = 2;
                          }
                        });
                      },
                    ),
                  ),

                  // ...List.generate(meals.length, (index) {
                  //   return Padding(
                  //     padding: EdgeInsets.only(bottom: 2.14.h),
                  //     child: MealTile(
                  //       title: meals[index],
                  //       isExpanded: selectedIndex == index,
                  //       onTap: () {
                  //         setState(() {
                  //           if (selectedIndex == index) {
                  //             selectedIndex = -1;
                  //           } else {
                  //             selectedIndex = index;
                  //           }
                  //         });
                  //       },
                  //     ),
                  //   );
                  // }),
                ],
              ),
            ),
          ),

          /// 🔹 Close Button (fixed bottom)
          SizedBox(height: 2.1.h),

          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.4.h),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(31, 31, 31, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Close",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
