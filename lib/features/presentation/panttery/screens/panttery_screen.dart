import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/grocery/widgets/searchbox_for_grocery.dart';
import 'package:restaurant_app/features/presentation/panttery/widgets/custom_header.dart';
import 'package:restaurant_app/features/presentation/panttery/widgets/pantery_card.dart';


class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

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
              SizedBox(height: 1.h),
              CustomHeader(),

              SizedBox(height: 3.5.h),

              SearchBox(),

              SizedBox(height: 2.h),

              // Text(
              //   "My Pantry",
              //   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              // ),
              SizedBox(height: 3.5.h),

              Expanded(
                child: ListView(
                  children: [
                    PantryCard(
                      image: "assets/pantery_screen/spinach.png",
                      title: "Spinach",
                      quantity: "1 bunch",
                    ),

                    PantryCard(
                      image: "assets/pantery_screen/chicken_breast.png",
                      title: "Chicken Breast",
                      quantity: "1 Ib",
                    ),

                    PantryCard(
                      image: "assets/pantery_screen/sweet potato.png",
                      title: "Sweet Potatoes",
                      quantity: "3 medium",
                    ),

                    PantryCard(
                      image: "assets/pantery_screen/brown_rice.png",
                      title: "Brown Rice",
                      quantity: "2 cups",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
