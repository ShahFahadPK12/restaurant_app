import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordScreen1 extends StatefulWidget {
  const ForgotPasswordScreen1({super.key});

  @override
  State<ForgotPasswordScreen1> createState() => _ForgotPasswordScreen1State();
}

class _ForgotPasswordScreen1State extends State<ForgotPasswordScreen1> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: SingleChildScrollView(
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
                    "Enter Code",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(45, 85, 145, 1),
                      height: 1,
                    ),
                  ),
                  Text(
                    "Enter a 4 digit code we have sent to your email.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otpBox(c1),
                      SizedBox(width: 2.7.w),
                      otpBox(c2),
                      SizedBox(width: 2.7.w),
                      otpBox(c3),
                      SizedBox(width: 2.7.w),
                      otpBox(c4),
                      SizedBox(width: 2.7.w),
                      otpBox(c5),
                      SizedBox(width: 2.7.w),
                      otpBox(c6),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.56),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (c1.text.isEmpty ||
                                c2.text.isEmpty ||
                                c3.text.isEmpty ||
                                c4.text.isEmpty ||
                                c5.text.isEmpty ||
                                c6.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please enter complete OTP"),
                                ),
                              );
                            } else {
                              Get.toNamed("/forgotPassword2");
                              print(
                                "ForgotPassword Screen 1 moving to forgotPassword Screen2",
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(96, 96, 96, 1),
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
      ),
    );
  }

  Widget otpBox(TextEditingController controller) {
    return SizedBox(
      width: 11.6.w,
      height: 5.3.h,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: "",
          hintText: "-",
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: controller.text.isNotEmpty
                  ? Colors.green
                  : Color.fromRGBO(217, 217, 217, 1),

              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(217, 217, 217, 1),
              width: 2,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(217, 217, 217, 1),
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {});
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return " ";
          }
          return null;
        },
      ),
    );
  }
}
