import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/auth/widgets/custom_button.dart';
import 'package:restaurant_app/presentation/auth/widgets/custom_text_field.dart';
import 'package:restaurant_app/presentation/auth/widgets/language_dropdown.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? selectedLanguage = "English";

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/auth/back arrow.png",
                        width: 8,
                        height: 12,
                      ),
                    ),
                    SizedBox(width: 30.w),
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
                SizedBox(height: 2.2.h),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(31, 31, 31, 1),
                    height: 1,
                  ),
                ),
                Text(
                  "Provide Your Info",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                ),

                SizedBox(height: 2.5.h),
                CustomTextField(
                  label: "Full Name",
                  hint: "Junaid Akram",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  hint: "juanidakram12@gmail.com",
                  validator: (value) {
                    if (value!.contains("@") && value.contains(".")) {
                      return null;
                    }
                    return "Please enter a valid email address";
                  },
                ),
                SizedBox(height: 1.h),

                Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(31, 31, 31, 1),
                    //height: 1,
                  ),
                ),
                SizedBox(height: 12),
                LanguageDropdown(
                  selectedValue: selectedLanguage,
                  languages: const ["English", "French", "Spanish"],
                  onChanged: (value) {
                    selectedLanguage = value;
                  },
                ),
                SizedBox(height: 1.7.h),
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  hint: "********",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: confirmPasswordController,
                  label: "Confirm password",
                  hint: "********",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password is required";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 0.1.h),

                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.7,
                      color: const Color.fromRGBO(64, 75, 82, 1),
                    ),
                    children: [
                      const TextSpan(text: "By signing up, you agree to our "),
                      TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(45, 85, 145, 1),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Terms clicked");
                          },
                      ),
                      const TextSpan(text: " & "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(45, 85, 145, 1),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Privacy clicked");
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 1.7.h),
                CustomButton(
                  text: "Sign Up",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform sign-up logic here
                      print("Form is valid. Proceed with sign-up.");
                    } else {
                      print("Form is invalid. Please correct the errors.");
                    }
                  },
                ),
                SizedBox(height: 1.7.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.7,
                        color: Color.fromRGBO(64, 75, 82, 1),
                      ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(45, 85, 145, 1),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed("/login");
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 1.7.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
