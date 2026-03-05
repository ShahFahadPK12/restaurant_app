import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color labelColor;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.labelColor = const Color.fromRGBO(0, 0, 0, 1),
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: widget.labelColor,

            height: 1.3,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          obscureText: widget.isPassword ? _obscureText : false,
          controller: widget.controller,
          validator: widget.validator,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 22,
              top: 14,
              bottom: 14,
              right: 22,
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.7,
              color: Color.fromRGBO(64, 75, 81, 1),
            ),
            filled: true,
            fillColor: Color.fromRGBO(255, 255, 255, 1),
            // 👇 Eye icon only for password
            suffixIcon: widget.isPassword
                ? IconButton(
                    padding: EdgeInsets.only(right: 22),
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Color.fromRGBO(64, 75, 82, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color.fromRGBO(217, 217, 217, 1),
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color.fromRGBO(217, 217, 217, 1),
                width: 1,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color.fromRGBO(255, 61, 0, 1),
                width: 1,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color.fromRGBO(255, 61, 0, 1),
                width: 1,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
