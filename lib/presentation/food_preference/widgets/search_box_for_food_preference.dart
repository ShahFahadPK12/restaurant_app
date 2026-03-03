import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBoxForFoodPreference extends StatelessWidget {
  const SearchBoxForFoodPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: Color.fromRGBO(217, 217, 217, 1), width: 1),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            size: 25,
            color: Color.fromRGBO(64, 75, 82, 1),
          ),
          hintText: "Search Food you enjoy",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
