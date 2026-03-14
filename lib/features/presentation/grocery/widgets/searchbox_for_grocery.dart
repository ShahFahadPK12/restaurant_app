import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: Color.fromRGBO(228, 228, 228, 1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.17), // rgba(0,0,0,0.17)
            offset: const Offset(0, 2), // x = 0 , y = 2
            blurRadius: 5.8, // blur
            spreadRadius: 0, // spread
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            size: 25,
            color: Color.fromRGBO(64, 75, 82, 1),
          ),
          hintText: "Search Items",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color.fromRGBO(64, 75, 82, 1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
