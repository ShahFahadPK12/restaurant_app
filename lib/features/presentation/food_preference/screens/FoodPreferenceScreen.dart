import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/food_preference/widgets/dietary_preference.dart';
import 'package:restaurant_app/features/presentation/food_preference/widgets/food_search_section.dart';
import 'package:restaurant_app/features/presentation/food_preference/widgets/save_preference.dart';


class FoodPreferenceScreen extends StatefulWidget {
  const FoodPreferenceScreen({super.key});

  @override
  State<FoodPreferenceScreen> createState() => _FoodPreferenceScreenState();
}

class _FoodPreferenceScreenState extends State<FoodPreferenceScreen> {
  List<String> likedFoods = [];
  List<String> avoidFoods = [];

  final likeController = TextEditingController();
  final avoidController = TextEditingController();

  Map<String, bool> dietaryPreferences = {
    "Vegetarian": true,
    "Vegan": false,
    "Gluten Free": false,
    "Dairy Free": false,
    "Keto": false,
    "Low Carb": false,
    "Low Sodium": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.3.h),
                Text(
                  "Food Preference",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color.fromRGBO(10, 6, 21, 1),
                  ),
                ),
                SizedBox(height: 4.h),

                FoodSearchSection(
                  title: "Foods You Like",
                  foods: likedFoods,
                  controller: likeController,
                  onAdd: (value) {
                    setState(() {
                      likedFoods.add(value);
                    });
                  },
                  onRemove: (value) {
                    setState(() {
                      likedFoods.remove(value);
                    });
                  },
                ),

                SizedBox(height: 3.h),

                FoodSearchSection(
                  title: "Foods To Avoid",
                  foods: avoidFoods,
                  controller: avoidController,
                  onAdd: (value) {
                    setState(() {
                      avoidFoods.add(value);
                    });
                  },
                  onRemove: (value) {
                    setState(() {
                      avoidFoods.remove(value);
                    });
                  },
                ),

                SizedBox(height: 3.5.h),

                DietaryPreferencesSection(
                  preferences: dietaryPreferences,
                  onChanged: (key, value) {
                    setState(() {
                      if (!value) {
                        // Check if removing will make all false
                        int selectedCount = dietaryPreferences.values
                            .where((v) => v)
                            .length;

                        // if (selectedCount <= 1) {
                        //   return; // Don't allow unchecking last one
                        // }
                      }
                      dietaryPreferences[key] = value;
                    });
                  },
                ),
                SizedBox(height: 3.5.h),
                SavePreferenceButton(),
                SizedBox(height: 3.5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
