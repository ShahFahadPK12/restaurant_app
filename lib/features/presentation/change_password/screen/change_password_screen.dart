import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.8.h),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color.fromRGBO(10, 6, 21, 1),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              SizedBox(height: 3.8.h),

              _buildPasswordField(
                label: 'Password*',
                hintText: 'Enter current password',
                controller: _currentPasswordController,
                obscureText: _obscureCurrentPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  });
                },
              ),

              SizedBox(height: 3.h),

              _buildPasswordField(
                label: 'New Password',
                hintText: 'Enter new password',
                controller: _newPasswordController,
                obscureText: _obscureNewPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),

              SizedBox(height: 3.h),

              _buildPasswordField(
                label: 'Confirm New Password',
                hintText: 'Re-enter new password',
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              const Spacer(),

              SizedBox(height: 6.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _changePassword,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.7.h),
                    backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color.fromRGBO(146, 153, 163, 1),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Color.fromRGBO(0, 0, 0, 1),
                size: 20,
              ),
              onPressed: onToggleVisibility,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(229, 233, 239, 1)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(229, 233, 239, 1)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(229, 233, 239, 1)),
            ),
            contentPadding: const EdgeInsets.only(bottom: 0),
          ),
        ),
      ],
    );
  }

  void _changePassword() {
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (currentPassword.isEmpty) {
      _showSnackBar('Please enter current password');
      return;
    }

    if (newPassword.isEmpty) {
      _showSnackBar('Please enter new password');
      return;
    }

    if (confirmPassword.isEmpty) {
      _showSnackBar('Please confirm new password');
      return;
    }

    if (newPassword != confirmPassword) {
      _showSnackBar('New password and confirm password do not match');
      return;
    }

    if (newPassword.length < 6) {
      _showSnackBar('Password must be at least 6 characters long');
      return;
    }

    _showSuccessBottomSheet();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // void _showSuccessDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Success'),
  //         content: const Text('Your password has been changed successfully!'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context); // Close dialog
  //               Get.back();
  //             },
  //             style: TextButton.styleFrom(
  //               foregroundColor: const Color.fromRGBO(31, 31, 31, 1),
  //             ),
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccessBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.6.w),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.73,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 20.2.h),
              Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(31, 31, 31, 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 12.w),
              ),

              SizedBox(height: 4.7.h),

              const Text(
                'Password Changed Successfully!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(31, 31, 31, 1),
                ),
              ),

              SizedBox(height: 1.h),

              // const Text(
              //   'Successfully!',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w600,
              //     color: Color.fromRGBO(31, 31, 31, 1),
              //   ),
              // ),
            ],
          ),
        );
      },
    );

    // 2 seconds baad automatically close
    // Future.delayed(const Duration(seconds: 2), () {
    //   if (Navigator.canPop(context)) {
    //     Navigator.pop(context);
    //     Get.back();
    //   }
    // });
  }
}
