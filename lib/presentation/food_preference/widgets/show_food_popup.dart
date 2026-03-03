import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showFoodPopup(
  BuildContext context,
  List<String> foods,
  Function(String) onRemove,
) {
  showDialog(
    context: context,
    builder: (_) {
      int selectedIndex = foods.length ~/ 2;

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 45.h,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  SizedBox(height: 2.h),

                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 7.h,
                      perspective: 0.003,
                      diameterRatio: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: foods.length,
                        builder: (context, index) {
                          bool isCenter = index == selectedIndex;

                          return Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                horizontal: isCenter ? 8.w : 6.w,
                                vertical: isCenter ? 1.5.h : 1.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    foods[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isCenter ? 17.sp : 14.sp,
                                      fontWeight: isCenter
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  GestureDetector(
                                    onTap: () {
                                      onRemove(foods[index]);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
