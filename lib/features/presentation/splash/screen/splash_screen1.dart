import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  int currentIndex = 0;
  void nextPage() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Get.offAllNamed("/welcome_auth");
    }
  }

  List images = [
    "assets/splash_screens/splash_screen1_bg.jpg",
    "assets/splash_screens/splash_screen2_bg.jpg",
    "assets/splash_screens/splash_screen3_bg.jpg",
  ];

  List titles = [
    "Welcome to Carli AI‑Powered Nutritionist – Your smart companion for healthy eating and meal planning.",
    "Personalized Meal Planning Plan meals tailored to your dietary preferences and goals.",
    "Smart Grocery List Automatically generate shopping lists based on your recipes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
          
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
              
                images[currentIndex],
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 6.h,
              left: 20,
              child: Row(
                children: List.generate(images.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: 31,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color.fromRGBO(31, 31, 31, 1)
                            : const Color.fromRGBO(225, 225, 225, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  );
                }),
              ),
            
            ),

            
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 80.h,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(1), Colors.transparent],
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
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[currentIndex],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 12.3.h),

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed("/welcome_auth");
                            },
                            child: Text(
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
                       
                            onPressed: nextPage,
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
            ),
          ],
        ),
      ),
    );
  }
}



