import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

class LanguageDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<String> languages;
  final ValueChanged<String?> onChanged;

  const LanguageDropdown({
    super.key,
    required this.selectedValue,
    required this.languages,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(153, 171, 198, 0.18),
            blurRadius: 62,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonFormField(
        initialValue: selectedValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 14,
          ),
          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Color.fromRGBO(75, 89, 107, 1),
        ),
        dropdownColor: Colors.white,
        items: languages
            .map(
              (lang) => DropdownMenuItem(
                value: lang,
                child: Text(
                  lang,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.7,
                    color: Color.fromRGBO(64, 75, 81, 1),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select language";
          }
          return null;
        },
      ),
    );
  }
}
