import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  String selectedLanguage = "English";

  final List<String> languages = ["English", "French"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 2.h),

              /// 🔹 Custom Header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0A0615),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3.h),

              /// 🔹 Language Dropdown Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedLanguage,
                    dropdownColor: Colors.black,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    style: const TextStyle(color: Colors.white),
                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              /// 🔹 Privacy Content
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "At TasteTrail, we take your privacy seriously. "
                    "We collect personal information such as your name, email, "
                    "and preferences like dietary needs, along with automatically "
                    "collected data such as device information, app usage, and "
                    "location data (if you opt-in).\n\n"
                    "We use this information to provide personalized recipe "
                    "suggestions, improve app performance, and keep you informed "
                    "with updates or notifications.\n\n"
                    "Your data is never sold, and we only share it with trusted "
                    "service providers (like analytics tools) or if legally required. "
                    "We take reasonable steps to protect your information, though "
                    "no system is entirely secure. You have control over your data "
                    "and can adjust settings in the app or opt out of notifications "
                    "whenever you wish.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: const Color(0xFF6E7781),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}