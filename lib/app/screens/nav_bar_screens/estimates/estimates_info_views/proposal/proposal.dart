import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: Get.height * 0.011,
                    ),
                    Text(
                      '2024-03-21 04:59:31',
                      style: fontStyle,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'River City Painting, Inc',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppinsRegular,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '4425 W Walker St',
                      style: fontStyle,
                    ),
                    Text(
                      'Wichita Kansas 67209',
                      style: fontStyle,
                    ),
                    Text(
                      'info@paintwichita.com',
                      style: fontStyle,
                    ),
                    Text(
                      '(316) 262-3289',
                      style: fontStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'tony lynch',
                      style: fontStyle,
                    ),
                    Text(
                      'new york',
                      style: fontStyle,
                    ),
                    Text(
                      'new york new york 10001',
                      style: fontStyle,
                    ),
                    Text(
                      'imsami67@gmail.com',
                      style: fontStyle,
                    ),
                    Text(
                      '(316) 262-3289',
                      style: fontStyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Image.asset(
              AppImages.pcaIcon,
              scale: 2.5,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  AppImages.workmanship,
                  scale: 3,
                ),
                Image.asset(
                  AppImages.winnerIcon,
                  scale: 3,
                ),
                Image.asset(
                  AppImages.safeIcon,
                  scale: 3,
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomHeaderContainer(
              title: 'Info',
              showTrailingIcon: false,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'tony lynch',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.poppinsRegular,
                          color: AppColors.red),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.house_fill,
                          color: AppColors.primaryRed,
                          size: 18,
                        ),
                        Text(
                          'new york',
                          style: fontStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.insert_chart,
                          color: AppColors.primaryRed,
                        ),
                        Text(
                          'Project Owner',
                          style: fontStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.book,
                          color: AppColors.primaryRed,
                        ),
                        Text(
                          'Estimate Pending Schedule',
                          style: fontStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Estimate',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.poppinsRegular,
                          color: AppColors.black),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
