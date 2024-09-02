import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({super.key, required this.title, this.onPress});
  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height:( 58/Get.height)*Get.height,
        width: (370/Get.width)*Get.width,
        
        decoration:const BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(title,style:const TextStyle(color: Colors.white,fontSize: 16,fontFamily: AppFonts.poppinsRegular,fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
