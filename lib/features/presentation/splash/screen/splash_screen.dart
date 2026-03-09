import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";
import "package:restaurant_app/features/data/auth/user_data_source/remote/auth_remote_data_source.dart";
import "package:restaurant_app/features/data/auth/user_repository/user_repository.dart";
import "package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthRepository authRepository = UserRepository(AuthRemoteDataSource());
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  bool _loaded = false;

  Future<void> checkLogin() async {
    final isLogged = await authRepository.isLoggedIn();

    if (isLogged) {
      Get.offAllNamed("/home");
    } else {
      Get.offAllNamed("/login");
    }
  }

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
    await Future.delayed(const Duration(seconds: 2));

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
