import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

import '../../../../resources/app_colors/app_colors.dart';

class ActionsEstimatesInfo extends StatelessWidget {
  const ActionsEstimatesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.height*0.02,),
          const CustomHeaderContainer(
            title: 'Action',
            showTrailingIcon: false,
          ),
          SizedBox(height: Get.height*0.02,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('Schedule Estimate', Icons.calendar_month_outlined, AppColors.green),
              _buildActionButton('Complete Estimate', CupertinoIcons.check_mark, AppColors.green),
            ],

          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('Copy Proposal Link', Icons.copy_rounded, AppColors.green),
              _buildActionButton('Advance Payment', Icons.attach_money_rounded, AppColors.primaryRed),
            ],

          ),
          _buildActionButton('Apply Discount', Icons.attach_money_rounded, AppColors.green),
          SizedBox(height: Get.height*0.02,),

          const CustomHeaderContainer(
            title: 'Document',
            showTrailingIcon: false,
          ),
          SizedBox(height: Get.height * 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('Preview', Icons.arrow_drop_down, AppColors.green),
              _buildActionButton('Send Receipt', CupertinoIcons.check_mark, AppColors.green),
            ],

          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('  Location', Icons.location_on_rounded, Colors.blue),
            ],

          ),

        ],
      ),
    );
  }






  Widget _buildActionButton(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Container(
        height: Get.height*0.045,
        width: Get.width*0.36,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 17),
            const SizedBox(width: 1),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
