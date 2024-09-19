import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for responsive design
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

import '../../utils/utils.dart';

class CustomizedTextField extends StatelessWidget {
  CustomizedTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.hintText,
    this.suffixIcon,
    this.isSeen = false,
    this.inputText,
    this.currentFocus,
    this.suffixClick,
    this.nextFocus,
  });

  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final Icon? suffixIcon;
  final bool isSeen;
  final TextInputType? inputText;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final VoidCallback? suffixClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05, // Equivalent to 47 height
      width: Get.width * 0.9 , // Equivalent to 370 width

      child: TextField(
        keyboardType: inputText,
        controller: controller,
        focusNode: currentFocus,
        obscureText: isSeen,
        cursorColor: Colors.grey,
        onSubmitted: (value) {
          if (nextFocus != null) {
            Utils.changeFocus(context, currentFocus!, nextFocus!);
          } else if (onSubmitted != null) {
            onSubmitted!(value);
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: AppFonts.interRegular,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: AppColors.textFieldFillColor,
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixClick, icon: suffixIcon!)
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.textFieldFillColor)),
        ),
      ),
    );
  }
}
