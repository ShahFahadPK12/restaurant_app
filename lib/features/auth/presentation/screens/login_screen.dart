import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:restaurant_app/features/auth/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kalleis",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color.fromRGBO(10, 6, 21, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.1.h),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(45, 85, 145, 1),
                      height: 1,
                    ),
                  ),
                  Text(
                    "Access Your Account",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    label: "Email",
                    hint: "junaidakram@gmail.com",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains("@") || !value.contains(".")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.7.h),

                  CustomTextField(
                    label: "Password",
                    hint: "********",
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 7.7.h),
                  CustomButton(
                    text: "Login",
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {

                      //   return null;
                      // }
                      Get.toNamed("/onboardingScreen1");
                    },
                  ),

                  SizedBox(height: 4.6.h),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/forgotPassword");
                    },
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(64, 75, 82, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
