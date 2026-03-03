import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.6.w, vertical: 1.6.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: const BorderSide(
                    color: Color.fromRGBO(239, 239, 239, 1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications V1",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, size: 22),
                  ),
                ],
              ),
            ),

            SizedBox(height: 2.h),

            Expanded(
              child: Column(
                children: [
                  notificationTile(
                    title: "Set alerts to remind you when to start cooking.",
                    time: "Just now",
                    isUnread: true,
                  ),

                  notificationTile(
                    title:
                        "Stay engaged with quick daily food & fitness tasks.",
                    time: "2 hours ago",
                    isUnread: false,
                  ),

                  notificationTile(
                    title: "Receive reminders to restock missing ingredients.",
                    time: "3 days ago",
                    isUnread: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Reusable Notification Tile
  Widget notificationTile({
    required String title,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.9.w, vertical: 1.6.h),
      decoration: BoxDecoration(
        border: Border(
          // top: const BorderSide(
          //   color: Color.fromRGBO(239, 239, 239, 1),
          //   width: 1,
          // ),
          bottom: const BorderSide(
            color: Color.fromRGBO(239, 239, 239, 1),
            width: 1,
          ),
        ),
      ),
      //padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isUnread
                  ? const Color.fromRGBO(230, 56, 58, 1) // unread red
                  : const Color.fromRGBO(146, 153, 163, 1), // read grey
            ),
          ),

          const SizedBox(width: 12),

          /// 🔹 Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(146, 153, 163, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
