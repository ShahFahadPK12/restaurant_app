import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
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

              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
                itemBuilder: (context) {
                  return languages.map((language) {
                    return PopupMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.7.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.language, color: Colors.white, size: 18),

                      SizedBox(width: 1.3.w),

                      Text(
                        selectedLanguage,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(width: 2.7.w),

                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 3.h),

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
