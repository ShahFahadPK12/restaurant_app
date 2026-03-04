import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    await Future.delayed(const Duration(seconds: 2));

    await _preloadImages();

    Get.offAllNamed("/splash1");
  }

  Future<void> _preloadImages() async {
    List<String> images = [
      "assets/splash_screens/splash_screen1_bg.jpg",
      "assets/splash_screens/splash_screen2_bg.jpg",
      "assets/splash_screens/splash_screen3_bg.jpg",
      "assets/onboarding/onboarding_screen1.png",
      "assets/onboarding/onboarding_screen2.png",
      "assets/auth/welcome-auth.png",
      "assets/auth/forgotPassword-image.png",
    ];

    for (var img in images) {
      await precacheImage(AssetImage(img), context);
    }

    //Get.offAllNamed("/splash1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash_screens/logo.png",
              height: 196,
              width: 200,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
