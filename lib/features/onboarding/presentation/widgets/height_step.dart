import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeightStep extends StatefulWidget {
  const HeightStep({super.key});

  @override
  State<HeightStep> createState() => _HeightStepState();
}

class _HeightStepState extends State<HeightStep> {
  String selectedUnit = "Centimetre";
  int height = 168;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select height",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(31, 31, 31, 1),
          ),
        ),
        SizedBox(height: 1.9.h),
        Text(
          "Compulsory",
          style: TextStyle(
            color: Color.fromRGBO(112, 112, 112, 1),
            height: 1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 26.5.h),

        Column(
          children: [
            Container(
              // width: 58.6.w,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 244, 248, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// FEET BUTTON
                  _buildUnitButton("Feet"),

                  /// CM BUTTON
                  _buildUnitButton("Centimetre"),
                ],
              ),
            ),

            SizedBox(height: 3.2.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 10.4.h,
                  width: 20.w,
                  //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
                  ),
                  child: Center(
                    child: Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 22.sp,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  selectedUnit == "Feet" ? "ft" : "cm",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUnitButton(String unit) {
    final bool isSelected = selectedUnit == unit;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUnit = unit;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          unit,
          style: TextStyle(
            color: isSelected
                ? Color.fromRGBO(255, 255, 255, 1)
                : Color.fromRGBO(64, 75, 82, 1),
            fontSize: 18,
            height: 3,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
