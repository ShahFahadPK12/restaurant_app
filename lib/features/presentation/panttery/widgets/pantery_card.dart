import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PantryCard extends StatelessWidget {
  final String image;
  final String title;
  final String quantity;

  const PantryCard({
    super.key,
    required this.image,
    required this.title,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 18.6.w,
              height: 10.5.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 2.3.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(31, 31, 31, 1),
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  quantity,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(146, 153, 163, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10.5.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Color.fromRGBO(31, 31, 31, 1),
                ),
                //SizedBox(height: 2.h),
                // Icon(
                //   Icons.delete_outlined,
                //   size: 20,
                //   color: Color.fromRGBO(112, 112, 112, 1),
                // ),
                Image.asset(
                  "assets/pantery_screen/delete_icon.png",
                  width: 5.5.w,
                  height: 2.5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
