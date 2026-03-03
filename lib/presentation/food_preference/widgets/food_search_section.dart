import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/food_preference/widgets/show_food_popup.dart';
import 'food_chip.dart';

class FoodSearchSection extends StatelessWidget {
  final String title;
  final List<String> foods;
  final TextEditingController controller;
  final Function(String) onAdd;
  final Function(String) onRemove;

  const FoodSearchSection({
    super.key,
    required this.title,
    required this.foods,
    required this.controller,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 3.4.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),

          SizedBox(height: 2.1.h),

          TextField(
            controller: controller,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                onAdd(value.trim());
                controller.clear();
              }
            },
            decoration: InputDecoration(
              hintText: "Search foods ",
              prefixIcon: const Icon(
                Icons.search,
                color: Color.fromRGBO(64, 75, 82, 1),
                size: 20,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.0.h,
                horizontal: 5.1.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
          ),

          SizedBox(height: 2.1.h),

          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CHIPS AREA
              Expanded(
                child: Wrap(
                  spacing: 2.w,
                  runSpacing: 1.h,
                  children: foods
                      .take(3)
                      .map(
                        (food) => FoodChip(
                          text: food,
                          onRemove: () => onRemove(food),
                        ),
                      )
                      .toList(),
                ),
              ),

              /// VIEW MORE (Right side if space available)
              if (foods.length > 3)
                GestureDetector(
                  onTap: () {
                    showFoodPopup(context, foods, onRemove);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 0.5.h),
                    child: Text(
                      "View More",
                      style: TextStyle(
                        color: Color.fromRGBO(44, 44, 44, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
