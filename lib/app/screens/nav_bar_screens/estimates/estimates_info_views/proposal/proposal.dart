import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_images.dart';

class Proposal extends StatelessWidget {
  Proposal({super.key});
  TextStyle fontStyle = TextStyle(
      fontFamily: AppFonts.poppinsRegular,
      color: AppColors.greyishBlack,
      fontSize: 13);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.appLogo,
                  scale: 1.4,
                ),
                Column(
                  children: [
                    Text(
                      'Estimates',
                      style: TextStyle(
                          fontFamily: AppFonts.poppinsRegular,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Text(
                      '2024-03-21 04:59:31',
                      style: fontStyle,
                    ),

                  ],
                )
              ],
            ),  SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'River City Painting, Inc',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppinsRegular,fontWeight: FontWeight.bold),
                    ),
                    Text('4425 W Walker St',style: fontStyle,),
                    Text('Wichita Kansas 67209',style: fontStyle,),
                    Text('info@paintwichita.com',style: fontStyle,),
                    Text('(316) 262-3289',style: fontStyle,),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('tony lynch',style: fontStyle,),
                    Text('Wichita Kansas 67209',style: fontStyle,),
                    Text('info@paintwichita.com',style: fontStyle,),
                    Text('(316) 262-3289',style: fontStyle,),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
