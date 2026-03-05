import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";
import "package:get/get_navigation/src/routes/transitions_type.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _loaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    preloadImages();
    if (!_loaded) {
      _loaded = true;
      preloadImages();
    }
  }

  Future preloadImages() async {
    await precacheImage(
      const AssetImage("assets/splash_screens/splash_screen1_bg.jpg"),
      context,
    );

    await precacheImage(
      const AssetImage("assets/splash_screens/splash_screen2_bg.jpg"),
      context,
    );

    await precacheImage(
      const AssetImage("assets/splash_screens/splash_screen3_bg.jpg"),
      context,
    );

    Get.toNamed("/splash1");
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
