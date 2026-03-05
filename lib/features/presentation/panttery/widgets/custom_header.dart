import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       
        Text(
          "My Pantry",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Color.fromRGBO(10, 6, 21, 1),
          ),
        ),
      ],
    );
  }
}
