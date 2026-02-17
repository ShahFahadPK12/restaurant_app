import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/auth/welcome-auth.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kalleis",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 400,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.0),
                      Color.fromRGBO(0, 0, 0, 1),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 14.6.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Your Ultimate Companion For Effortless Cooking",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 1.2.h),
                    Text(
                      "Where our AI craft delicious recipies from what you have at home! ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 4.6.h),
                    InkWell(
                      onTap: () => Get.toNamed("/signUp"),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 1.7.h),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(31, 31, 31, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Create an account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(209, 209, 209, 1),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(209, 209, 209, 1),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign In",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
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
