import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';

class OnboardingScreen6 extends StatefulWidget {
  const OnboardingScreen6({super.key});

  @override
  State<OnboardingScreen6> createState() => _OnboardingScreen6State();
}

class _OnboardingScreen6State extends State<OnboardingScreen6> {
  TextEditingController heightController = TextEditingController();
  // Shared validation controller (created in OnboradingScreen3).
  final OnboardingValidationController _validationController =
      Get.find<OnboardingValidationController>();

  @override
  void initState() {
    super.initState();
    // Roman Urdu: agar pehle se value ho to wapas show kar do.
    if (_validationController.height.value != null) {
      height = _validationController.height.value;
      heightController.text = _validationController.height.value.toString();
    }
    selectedUnit = _validationController.heightUnit.value;
  }

  String? selectedUnit;
  int? height;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  color: Color.fromRGBO(228, 228, 228, 1),
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
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 8.h,
                      // width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "168",
                          ),
                          onChanged: (value) {
                            final parsed = int.tryParse(value);
                            setState(() {
                              height = parsed;
                            });
                            // Roman Urdu: user ki height save kar rahe hain.
                            _validationController.height.value = parsed;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    selectedUnit == null
                        ? ""
                        : (selectedUnit == "Feet" ? "ft" : "cm"),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Container(
              //       height: 10.4.h,
              //       width: 20.w,
              //       //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              //       decoration: BoxDecoration(
              //         color: Colors.white,

              //         borderRadius: BorderRadius.circular(12),
              //         border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
              //       ),
              //       child: Center(
              //         child: Text(
              //           height.toString(),
              //           style: TextStyle(
              //             fontSize: 22.sp,

              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Text(
              //       selectedUnit == "Feet" ? "ft" : "cm",
              //       style: const TextStyle(fontSize: 18),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnitButton(String unit) {
    final bool isSelected = selectedUnit == unit;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUnit = unit;
        });
        // Roman Urdu: unit selection ko validation ke liye save kar rahe hain.
        _validationController.heightUnit.value = unit;
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
            height: 2.2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
