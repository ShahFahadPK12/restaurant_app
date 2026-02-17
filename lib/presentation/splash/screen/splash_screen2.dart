import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/splash_screens/splash_screen2_bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 6.h,
              left: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/splash1");
                      print("first splash screen is clicking from screen 2");
                    },
                    child: Container(
                      width: 31,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/splash3");
                      print("third splash screen is clicking from screen 2");
                    },
                    child: Container(
                      width: 31,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/splash3");
                      print("third splash screen is clicking from screen 2");
                    },
                    child: Container(
                      width: 31,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 225, 225, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60.h,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 6.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Spacer(),

                    /// Description Text
                    const Text(
                      "Personalized Meal Planning  & AI-driven meal plans tailored to your dietary preferences and goals.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 12.3.h),

                    /// Bottom Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed("/signIn");
                          },
                          child: const Text(
                            "Skip",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 1,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/splash3");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(31, 31, 31, 1),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10),

                              Image.asset(
                                "assets/splash_screens/arrows.png",
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
