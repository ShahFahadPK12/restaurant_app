import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen5 extends StatefulWidget {
  const OnboardingScreen5({super.key});

  @override
  State<OnboardingScreen5> createState() => _OnboardingScreen5State();
}

class _OnboardingScreen5State extends State<OnboardingScreen5> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select date of birth",
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
        SizedBox(height: 31.h),

        /// Date Field
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _controller.text.isEmpty ? "MM/DD/YYYY" : _controller.text,
                  style: TextStyle(
                    color: _controller.text.isEmpty
                        ? Colors.grey
                        : Colors.black,
                    fontSize: 16,
                  ),
                ),
                //Icon(Icons.calendar_today, size: 18),
                Image.asset(
                  "assets/onboarding/onboarding_calendar.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
