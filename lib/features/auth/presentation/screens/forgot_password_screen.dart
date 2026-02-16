import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/auth/presentation/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/auth/forgotPassword-image.png", // replace with yours
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 20.h,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0), // transparent
                            Color.fromRGBO(0, 0, 0, 0.8), // black
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 6.1.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
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
                                    "assets/auth/backArrowWhite.png",
                                    width: 8,
                                    height: 12,
                                  ),
                                ),
                                SizedBox(width: 18.w),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Forget Password",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 46.5.h),
                              Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "No worries, we’ll help you reset it in no time",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                color: Color.fromRGBO(220, 220, 220, 1),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            CustomTextField(
                              label: "Email",
                              controller: emailController,
                              hint: "junaidakram@gmail.com",
                              labelColor: Colors.white,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email is required";
                                }
                                if (!value.contains("@") ||
                                    !value.contains(".")) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 13.h),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.toNamed("/forgotPassword1");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(
                                        31,
                                        31,
                                        31,
                                        1,
                                      ),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                            ),
                          ],
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
