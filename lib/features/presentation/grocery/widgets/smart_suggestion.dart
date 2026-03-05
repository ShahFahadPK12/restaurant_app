import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

class SmartSuggestionCard extends StatelessWidget {
  const SmartSuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      margin: EdgeInsets.only(right: 5.5.w),
      padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 1.9.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: const Icon(Icons.refresh, size: 18),
          // ),
          Row(
            children: [
              SizedBox(
                width: 22.w,
                height: 22.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/pantery_screen/placeholder.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 2.3.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Bananas",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(31, 31, 31, 1),
                      ),
                    ),

                    SizedBox(height: 0.5.h),

                    Text(
                      "Seasonal Favorite",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromRGBO(146, 153, 163, 1),
                      ),
                    ),

                    SizedBox(height: 1.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.4.w,
                        vertical: 0.5.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(children: [const Icon(Icons.refresh, size: 18)]),
            ],
          ),
        ],
      ),
    );
  }
}
