import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.6.h),

              /// Title
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color.fromRGBO(10, 6, 21, 1),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                "Update your settings like notification, diet preference, profile edit etc.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color.fromRGBO(146, 153, 163, 1),
                  height: 1,
                ),
              ),

              const SizedBox(height: 30),

              /// First 4 buttons with divider
              _settingsTile(
                imagePath: "assets/setting/profile_setting.png",
                title: "Profile Information",
                subtitle: "Change your information",
              ),

              _settingsTile(
                imagePath: "assets/setting/dietery_preference.png",
                title: "Dietary Preferences",
                subtitle: "Adjust your diet preference",
              ),

              _settingsTile(
                imagePath: "assets/setting/ai_recovery.png",
                title: "Ai Recipe History",
                subtitle: "See history to make better dishes",
              ),

              _settingsTile(
                imagePath: "assets/setting/privacy.png",
                title: "Privacy",
                subtitle: "Terms & Conditions",
              ),

              /// Fifth button (no divider after)
              _settingsTile(
                imagePath: "assets/setting/language.png",
                title: "Language",
                subtitle: "English",
                showTrailing: false,
              ),

              SizedBox(height: 2.6.h),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(146, 153, 163, 1),
                ),
              ),
              SizedBox(height: 2.5.h),
              notificationTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsTile({
    required String imagePath,
    required String title,
    required String subtitle,
    bool showTrailing = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Image.asset(imagePath, width: 24, height: 24),
        ),

        SizedBox(width: 6.0.w),

        Expanded(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    height: 1.2,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(146, 153, 163, 1),
                  ),
                ),
                trailing: showTrailing
                    ? const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      )
                    : null,
                onTap: () {
                  Get.toNamed("/notification");
                },
              ),

              const Divider(height: 1, color: Color.fromRGBO(229, 233, 239, 1)),
            ],
          ),
        ),
      ],
    );
  }

  Widget notificationTile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/setting/bell.png", width: 24, height: 24),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Psuh Notifications",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(112, 112, 112, 1),
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "For daily updates",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Color.fromRGBO(31, 31, 31, 1),
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                  ),
                ],
              ),

              SizedBox(height: 0.8.h),
              Divider(height: 1, color: Color.fromRGBO(229, 233, 239, 1)),
            ],
          ),
        ),
      ],
    );
  }
}
