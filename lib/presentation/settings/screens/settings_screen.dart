import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// Title
              const Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 4),

              const Text(
                "Update your settings like notification, diet preference, profile edit etc.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// First 4 buttons with divider
              _settingsTile(
                icon: Icons.person,
                title: "Profile Information",
                subtitle: "Change your information",
              ),
              const Divider(),

              _settingsTile(
                icon: Icons.restaurant_menu,
                title: "Dietary Preferences",
                subtitle: "Adjust your diet preference",
              ),
              const Divider(),

              _settingsTile(
                icon: Icons.history,
                title: "Ai Recipe History",
                subtitle: "See history to make better dishes",
              ),
              const Divider(),

              _settingsTile(
                icon: Icons.lock,
                title: "Privacy",
                subtitle: "Terms & Conditions",
              ),

              const SizedBox(height: 20),

              /// Fifth button (no divider after)
              _settingsTile(
                icon: Icons.language,
                title: "Language",
                subtitle: "English",
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable Tile Widget
  Widget _settingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool showTrailing = true,
  }) {
    return Row(
      children: [
        Image.asset(
          "assets/setting/profile_setting.png",
          width: 20,
          height: 20,
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, size: 24),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),

            // 👇 Yahan condition laga do
            trailing: showTrailing
                ? const Icon(Icons.arrow_forward_ios, size: 16)
                : null,

            onTap: () {},
          ),
        ),
      ],
    );
  }
}
