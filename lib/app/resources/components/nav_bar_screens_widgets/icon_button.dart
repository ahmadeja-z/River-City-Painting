import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart'; // Import your assets file

class CustomIconButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const CustomIconButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.045, // Adjusted to be more responsive
        width: Get.width * 0.3,   // Adjusted to be more responsive
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive border radius
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
