import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:restaurant_app/features/auth/presentation/widgets/custom_text_field.dart';

class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({super.key});

  @override
  State<ForgotPasswordScreen2> createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 6.h),
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
                        SizedBox(width: 18.w),
                        Text(
                          textAlign: TextAlign.center,
                          "Forget Password",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Color.fromRGBO(10, 6, 21, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Choose a New Password",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(45, 85, 145, 1),
                        height: 1,
                      ),
                    ),
                    Text(
                      "Enter and confirm your new password to regain access",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      label: "Password",
                      hint: "********",
                      isPassword: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Enter passowrd";
                        } else if (value.length < 6) {
                          return "Password Must be Greater than 6 character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 1.7.h),
                    CustomTextField(
                      label: "Confirm Password",
                      hint: "Confirm Password",
                      isPassword: true,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return "Password Does not match";
                        }
                        return null;
                      },
                    ),
                    //Spacer(),
                    //SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                    SizedBox(height: 38.h),
                    CustomButton(text: "Reset Password", onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
