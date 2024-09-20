import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_icons.dart';

import '../../app_colors/app_colors.dart';

class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({
    super.key,
    required this.title,
    this.onTap,
    this.editAble = false,
    this.showTrailingIcon = true,
  });

  final String title;
  final VoidCallback? onTap;
  final bool? editAble;
  final bool? showTrailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 12),

      width: double.infinity,
      color: AppColors.primaryRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.poppinsRegular,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          if (showTrailingIcon == true)
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                editAble == true ? AppIcons.editIcon : AppIcons.addIcon,
                scale: 1.5,
              ),
            ),
        ],
      ),
    );
  }
}
