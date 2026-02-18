import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

class Onboardingscreen16 extends StatefulWidget {
  const Onboardingscreen16({super.key});

  @override
  State<Onboardingscreen16> createState() => _Onboardingscreen16State();
}

class _Onboardingscreen16State extends State<Onboardingscreen16> {
  String selectedActivity = "Vegan";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Do you have any dietary restrictions or allergies?",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F1F1F),
            ),
          ),

          SizedBox(height: 1.5.h),

          /// Subtitle
          Text(
            "Select Choice",
            style: TextStyle(fontSize: 16.sp, color: const Color(0xFF707070)),
          ),

          SizedBox(height: 17.h),

          Wrap(
            spacing: 4.w,
            runSpacing: 2.h,
            children: [
              _buildActivityButton("Vegan"),
              _buildActivityButton("Vegetarian"),
              _buildActivityButton("Pescetarian"),
              _buildActivityButton("Gluten-free"),
              _buildActivityButton("Lactose intolerance"),
              _buildActivityButton("Peanut allergy"),
              _buildActivityButton("Other"),
              _buildActivityButton("None"),
            ],
          ),
          SizedBox(height: 17.h),
        ],
      ),
    );
  }

  Widget _buildActivityButton(String title) {
    bool isSelected = selectedActivity == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedActivity = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromRGBO(31, 31, 31, 1) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(Icons.check, color: Colors.white, size: 18),

            if (isSelected) SizedBox(width: 1.w),

            Text(
              title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : Color.fromRGBO(112, 112, 112, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
