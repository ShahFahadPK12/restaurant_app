import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';

class OnboardingScreen7 extends StatefulWidget {
  const OnboardingScreen7({super.key});

  @override
  State<OnboardingScreen7> createState() => _OnboardingScreen7State();
}

class _OnboardingScreen7State extends State<OnboardingScreen7> {
  String? selectedUnit;
  TextEditingController weightController = TextEditingController();
  // Shared validation controller (created in OnboradingScreen3).
  final OnboardingValidationController _validationController =
      Get.find<OnboardingValidationController>();

  @override
  void initState() {
    super.initState();
    // Roman Urdu: agar pehle se value ho to wapas show kar do.
    if (_validationController.weight.value != null) {
      weightController.text = _validationController.weight.value.toString();
    }
    selectedUnit = _validationController.weightUnit.value;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            "Select weight",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(31, 31, 31, 1),
            ),
          ),

          SizedBox(height: 1.5.h),

          /// SUBTITLE
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

          /// UNIT TOGGLE
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 228, 228, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildUnitButton("Pound"),
                    _buildUnitButton("Kilogram"),
                  ],
                ),
              ),
              SizedBox(height: 3.2.h),

              /// WEIGHT INPUT
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) {
                          final parsed = int.tryParse(value);
                          // Roman Urdu: user ka weight save kar rahe hain.
                          _validationController.weight.value = parsed;
                        },

                        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    selectedUnit == null
                        ? ""
                        : (selectedUnit == "Kilogram" ? "kg" : "lb"),
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),
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
        _validationController.weightUnit.value = unit;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          unit,
          style: TextStyle(
            fontSize: 18,
            height: 2.0,
            fontWeight: FontWeight.w400,
            color: isSelected
                ? Color.fromRGBO(255, 255, 255, 1)
                : Color.fromRGBO(64, 75, 82, 1),
          ),
        ),
      ),
    );
  }
}
