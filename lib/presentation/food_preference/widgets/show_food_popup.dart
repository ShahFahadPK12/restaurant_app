//  wheel scroll one.

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showFoodPopup(
  BuildContext context,
  List<String> foods,
  Function(String) onRemove,
) {
  showDialog(
    context: context,
    builder: (context) {
      int selectedIndex = foods.length ~/ 2;

      return Dialog(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          height: 45.h,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Stack(
                children: [
                  /// 🔹 Scroll List
                  ListWheelScrollView(
                    itemExtent: 6.h,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children: List.generate(foods.length, (index) {
                      bool isCenter = index == selectedIndex;

                      return Column(
                        children: [
                          Container(
                            height: isCenter ? 4.h : 3.h,
                            width: isCenter ? 68.w : 40.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isCenter
                                  ? const Color.fromRGBO(31, 31, 31, 1)
                                  : const Color.fromRGBO(31, 31, 31, 0.65),
                              borderRadius: BorderRadius.circular(
                                isCenter ? 32 : 16,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// 🔹 Food Name
                                Text(
                                  foods[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isCenter ? 17.sp : 14.sp,
                                    fontWeight: isCenter
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),

                                SizedBox(width: 2.w),

                                /// 🔹 Cross Icon Inside Button
                                GestureDetector(
                                  onTap: () {
                                    onRemove(foods[index]);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: isCenter ? 18 : 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 0.9.h), // gap between buttons
                        ],
                      );
                    }),
                  ),

                  /// 🔹 Cross Icon Top Right (Close Dialog)
                  Positioned(
                    top: 3.4.h,
                    right: 4.1.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}




// linear sheet one 

// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// void showFoodPopup(
//   BuildContext context,
//   List<String> foods,
//   Function(String) onRemove,
// ) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: SizedBox(
//           height: 45.h,
//           child: _LinearFoodList(foods: foods, onRemove: onRemove),
//         ),
//       );
//     },
//   );
// }

// class _LinearFoodList extends StatefulWidget {
//   final List<String> foods;
//   final Function(String) onRemove;

//   const _LinearFoodList({required this.foods, required this.onRemove});

//   @override
//   State<_LinearFoodList> createState() => _LinearFoodListState();
// }

// class _LinearFoodListState extends State<_LinearFoodList> {
//   final ScrollController _controller = ScrollController();
//   int selectedIndex = 0;

//   double itemHeight = 60; // har button ki height fix

//   @override
//   void initState() {
//     super.initState();

//     // Jab scroll hoga to center index change hoga
//     _controller.addListener(() {
//       double offset = _controller.offset;

//       int index = (offset / itemHeight).round();

//       if (index >= 0 && index < widget.foods.length) {
//         setState(() {
//           selectedIndex = index;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: _controller,
//       itemCount: widget.foods.length,
//       padding: EdgeInsets.symmetric(vertical: 2.h),

//       itemBuilder: (context, index) {
//         bool isCenter = index == selectedIndex;

//         return Center(
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 200),
//             height: itemHeight,
//             margin: EdgeInsets.symmetric(vertical: 0.8.h),

//             padding: EdgeInsets.symmetric(horizontal: 8.w),

//             decoration: BoxDecoration(
//               color: isCenter
//                   ? const Color.fromRGBO(31, 31, 31, 1) // center color
//                   : const Color.fromRGBO(31, 31, 31, 0.65), // normal color
//               borderRadius: BorderRadius.circular(30),
//             ),

//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   widget.foods[index],
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: isCenter ? 17.sp : 14.sp,
//                     fontWeight: isCenter ? FontWeight.w600 : FontWeight.w400,
//                   ),
//                 ),

//                 SizedBox(width: 2.w),

//                 GestureDetector(
//                   onTap: () {
//                     widget.onRemove(widget.foods[index]);
//                   },
//                   child: Icon(Icons.close, color: Colors.white, size: 16),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
