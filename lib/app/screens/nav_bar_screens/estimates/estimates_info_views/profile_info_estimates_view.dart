import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

import '../../../../resources/assets/app_fonts.dart';

class ProfileInfoEstimatesView extends StatelessWidget {
  const ProfileInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*0.02,),
            CustomHeaderContainer(title:'Profile',editAble: true,),
            SizedBox(height: Get.height*0.02,),

            Container(


            margin: EdgeInsets.all(12.0),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Section (Customer Info)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'tony lynch',
                        style: TextStyle(
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.poppinsRegular,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      _infoRow(CupertinoIcons.house_fill, 'new york'),
                      _infoRow(CupertinoIcons.mail_solid, 'imsami67@gmail.com'),
                      _infoRow(Icons.phone, '1234567890'),
                      _infoRow(CupertinoIcons.person_alt, 'Project Owner: Admin'),
                      _infoRow(Icons.apartment, 'Project Type: exterior'),
                      _infoRow(Icons.house, 'Building Type: residential'),
                      const Divider(),
                      _infoRow(CupertinoIcons.calendar_today,
                          'Estimate Pending Schedule'),
                    ],
                  ),
                  // Right Section (Estimate Info)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Estimate',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: AppFonts.poppinsRegular),
                      ),
                      SizedBox(height: Get.height*0.01),
                      const Text(
                        'pending',
                        style: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13),
                      ),
                      const Text(
                        '04, March 2024',
                        style: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      _priceText('Total', '\$0.00', AppColors.red),
                      _priceText('Invoiced', '\$0.00', AppColors.black),
                      _priceText('Paid', '\$0.00', AppColors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryRed,
            size: 16,
          ),
          SizedBox(width: Get.width * 0.02),
          Text(
            text,
            style: const TextStyle(
                fontFamily: AppFonts.poppinsRegular, color: AppColors.black,fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _priceText(String label, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.poppinsRegular,
                color: AppColors.black,fontSize: 13),
          ),
          Text(
            amount,
            style: TextStyle(color: color, fontFamily: AppFonts.poppinsRegular,fontSize: 13),
          ),
        ],
      ),
    );
  }
}
