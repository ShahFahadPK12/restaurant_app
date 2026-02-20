import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/auth/screens/forgot_password_screen.dart';
import 'package:restaurant_app/presentation/auth/screens/forgot_password_screen1.dart';
import 'package:restaurant_app/presentation/auth/screens/forgot_password_screen2.dart';
import 'package:restaurant_app/presentation/auth/screens/login_screen.dart';
import 'package:restaurant_app/presentation/auth/screens/sign_in_screen.dart';
import 'package:restaurant_app/presentation/auth/screens/sign_up_screen.dart';
import 'package:restaurant_app/presentation/dashboard/main_screen.dart';
import 'package:restaurant_app/presentation/home/screens/home_screen.dart';
import 'package:restaurant_app/presentation/onboarding/screens/onboarding_screen1.dart';
import 'package:restaurant_app/presentation/onboarding/screens/onboarding_screen2.dart';
import 'package:restaurant_app/presentation/onboarding/screens/onborading_screen3.dart';
import 'package:restaurant_app/presentation/settings/screens/settings_screen.dart';
import 'package:restaurant_app/presentation/splash/screen/splash_screen.dart';
import 'package:restaurant_app/presentation/splash/screen/splash_screen1.dart';
import 'package:restaurant_app/presentation/splash/screen/splash_screen2.dart';
import 'package:restaurant_app/presentation/splash/screen/splash_screen3.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: 'Roboto',
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Color.fromRGBO(255, 255, 255, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                // borderSide: BorderSide(
                //   color: Color.fromRGBO(217, 217, 217, 1),
                //   width: 1,
                // ),
              ),
            ),
          ),

          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: "/", page: () => SplashScreen()),
            GetPage(name: "/splash1", page: () => SplashScreen1()),
            GetPage(name: "/splash2", page: () => SplashScreen2()),
            GetPage(name: "/splash3", page: () => SplashScreen3()),
            GetPage(name: "/signIn", page: () => SignInScreen()),
            GetPage(name: "/signUp", page: () => SignUpScreen()),
            GetPage(name: "/login", page: () => LoginScreen()),
            GetPage(
              name: "/forgotPassword",
              page: () => ForgotPasswordScreen(),
            ),
            GetPage(
              name: "/forgotPassword1",
              page: () => ForgotPasswordScreen1(),
            ),
            GetPage(
              name: "/forgotPassword2",
              page: () => ForgotPasswordScreen2(),
            ),

            GetPage(
              name: "/onboardingScreen1",
              page: () => OnboardingScreen1(),
            ),

            GetPage(
              name: "/onboardingScreen2",
              page: () => OnboardingScreen2(),
            ),

            GetPage(
              name: "/onboardingScreen3",
              page: () => OnboradingScreen3(),
            ),
            GetPage(name: "/setting", page: () => SettingsScreen()),
            GetPage(name: "/home", page: () => HomeScreen()),
            GetPage(name: "/main", page: () => MainScreen()),
          ],

          home: SplashScreen(),
        );
      },
    );
  }
}
