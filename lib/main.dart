import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/auth/screens/forgot_password_screen.dart';
import 'package:restaurant_app/features/presentation/auth/screens/forgot_password_screen1.dart';
import 'package:restaurant_app/features/presentation/auth/screens/forgot_password_screen2.dart';
import 'package:restaurant_app/features/presentation/auth/screens/login_screen.dart';
import 'package:restaurant_app/features/presentation/auth/screens/sign_up_screen.dart';
import 'package:restaurant_app/features/presentation/auth/screens/welcome_authScreen.dart';
import 'package:restaurant_app/features/presentation/change_password/screen/change_password_screen.dart';
import 'package:restaurant_app/core/dashboard/main_screen.dart';
import 'package:restaurant_app/features/presentation/food_preference/screens/FoodPreferenceScreen.dart';
import 'package:restaurant_app/features/presentation/grocery/screen/grocery_screen.dart';
import 'package:restaurant_app/features/presentation/home/screens/home_screen.dart';
import 'package:restaurant_app/features/presentation/notifications/screens/notification_screend.dart';
import 'package:restaurant_app/features/presentation/onboarding/screens/onboarding_screen1.dart';
import 'package:restaurant_app/features/presentation/onboarding/screens/onboarding_screen2.dart';
import 'package:restaurant_app/features/presentation/onboarding/screens/onborading_screen3.dart';
import 'package:restaurant_app/features/presentation/panttery/screens/panttery_screen.dart';
import 'package:restaurant_app/features/presentation/privacy_policy/screens/privacy_policy.dart';
import 'package:restaurant_app/features/presentation/profile_setting/screens/profile_setting.dart';
import 'package:restaurant_app/features/presentation/settings/screens/settings_screen.dart';
import 'package:restaurant_app/features/presentation/splash/screen/splash_screen.dart';
import 'package:restaurant_app/features/presentation/splash/screen/splash_screen1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isPreloaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isPreloaded) {
      preloadImages(context);
      _isPreloaded = true;
    }
  }

  Future preloadImages(BuildContext context) async {
    await precacheImage(
      const AssetImage("assets/splash_screens/splash_screen1_bg.jpg"),
      context,
    );
    await precacheImage(
      const AssetImage("assets/auth/welcome-auth.jpg"),
      context,
    );
    await precacheImage(
      const AssetImage("assets/auth/forgotPassword-image.png"),
      context,
    );
  }

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
            GetPage(name: "/welcome_auth", page: () => WelcomeAuthScreen()),
            GetPage(name: "/signUp", page: () => SignUpScreen()),
            GetPage(name: "/login", page: () => LoginScreen()),
            GetPage(
              name: "/forgotPassword",
              page: () => ForgotPasswordScreen(),
            ),
            GetPage(name: "/otpScreen", page: () => ForgotPasswordScreen1()),
            GetPage(
              name: "/resetPassword",
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
            GetPage(
              name: "/profileSetting",
              page: () => ProfileSettingsScreen(),
            ),
            GetPage(
              name: "/changePassword",
              page: () => ChangePasswordScreen(),
            ),
            GetPage(
              name: "/privacy_poliocy",
              page: () => PrivacyPolicyScreen(),
            ),
            GetPage(name: "/notification", page: () => NotificationScreen()),
            GetPage(name: "/pantery_screen", page: () => PantryScreen()),
            GetPage(name: "/grocery_list", page: () => GroceryListScreen()),
            GetPage(name: "/food_pref", page: () => FoodPreferenceScreen()),
          ],

          home: SplashScreen(),
        );
      },
    );
  }
}
