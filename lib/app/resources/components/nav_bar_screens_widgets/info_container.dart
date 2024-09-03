import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class InfoContainer extends StatelessWidget {

  final String title;
  final String imageIcon;
  final int total;

  const InfoContainer({super.key, required this.title, required this.imageIcon, required this.total});


  @override
  Widget build(BuildContext context) {

    return Container(
      height: Get.height*0.08,
      width: Get.width*0.46,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Adjust background color if needed
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.poppinsRegular,
                  fontSize: 11,
                ),
              ),
              Text(
                total.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFonts.poppinsRegular,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryRed,
            ),
            child: Center(
              child: Image.asset(imageIcon,scale: 2,

              ),
            ),
          ),
        ],
      ),
    );
  }
}