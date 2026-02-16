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
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   List<String> images = [
  //     "assets/splash_screens/splash_screen1_bg.jpg",
  //     "assets/splash_screens/splash_screen2_bg.jpg",
  //     "assets/splash_screens/splash_screen3_bg.jpg",
  //     "assets/onboarding/onboarding_screen1.png",
  //     "assets/onboarding/onboarding_screen2.png",
  //     "assets/auth/welcome-auth.png",
  //     "assets/auth/forgotPassword-image.png",
  //   ];
  //   for (var img in images) {
  //     precacheImage(AssetImage(img), context);
  //   }
  // }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(
        AssetImage("assets/splash_screens/splash_screen1_bg.jpg"),
        context,
      );
      precacheImage(
        AssetImage("assets/splash_screens/splash_screen2_bg.jpg"),
        context,
      );
      Get.offAllNamed("/splash1");
    });
    // didChangeDependencies();
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.offAllNamed("/splash1");
    // });
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

    Get.offAllNamed("/splash1");
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
