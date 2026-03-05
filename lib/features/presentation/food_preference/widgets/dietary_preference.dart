import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DietaryPreferencesSection extends StatelessWidget {
  final Map<String, bool> preferences;
  final Function(String, bool) onChanged;

  const DietaryPreferencesSection({
    super.key,
    required this.preferences,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            "Dietary Preferences",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(10, 6, 21, 1),
            ),
          ),

          SizedBox(height: 2.h),

          /// RESPONSIVE GRID
          LayoutBuilder(
            builder: (context, constraints) {
              // Width ke hisaab se columns decide karo
              int crossAxisCount = constraints.maxWidth < 250 ? 1 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: preferences.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 1.h,
                  crossAxisSpacing: 4.w,
                  childAspectRatio: 4.5,
                ),
                itemBuilder: (context, index) {
                  String key = preferences.keys.elementAt(index);

                  return Row(
                    children: [
                      /// CHECKBOX
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
                          value: preferences[key],
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          side: const BorderSide(
                            color: Color.fromRGBO(31, 31, 31, 1),
                            width: 1,
                          ),
                          onChanged: (value) {
                            onChanged(key, value ?? false);
                          },
                        ),
                      ),

                      /// TEXT
                      Expanded(
                        child: Text(
                          key,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color.fromRGBO(31, 31, 31, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
