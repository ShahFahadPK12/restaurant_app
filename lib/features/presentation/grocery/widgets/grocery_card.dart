import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GroceryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const GroceryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 4.0.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Main Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              SizedBox(
                width: 18.w,
                height: 18.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),

              SizedBox(width: 3.w),

              // Title + Subtitle + Button
              Expanded(
                child: SizedBox(
                  height: 18.w, // image ke barabar height
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(31, 31, 31, 1),
                        ),
                      ),

                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 0.6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Add to Pantry",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Delete Icon (Top Right Exact Corner)
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/pantery_screen/delete_icon.png",
              width: 4.w,
              height: 4.w,
            ),
          ),
        ],
      ),
    );
  }
}
