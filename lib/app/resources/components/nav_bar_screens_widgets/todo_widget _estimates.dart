import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

import '../../app_colors/app_colors.dart';

class ToDoItemWidget extends StatelessWidget {
  final String title;
  final String assignedTo;
  final String startDate;
  final String endDate;
  final String note;
  final VoidCallback onDelete;

  const ToDoItemWidget({
    super.key,
    required this.title,
    required this.assignedTo,
    required this.startDate,
    required this.endDate,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyishBlack.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 17,
              color: AppColors.primaryRed,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: Get.height*0.02),
          Text(
            'Assigned to: $assignedTo',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: AppColors.greyishBlack,
            ),
          ),
          SizedBox(height: Get.height*0.006),
          Text(
            'Start Date: $startDate',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: AppColors.greyishBlack,
            ),
          ),
          SizedBox(height: Get.height*0.006),
          Text(
            'End Date: $endDate',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: AppColors.greyishBlack,
            ),
          ),
          SizedBox(height: Get.height*0.006),
          Text(
            'Note:',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: Get.width*0.8,
              child:Text(note,style: TextStyle(color: AppColors.black,fontFamily: AppFonts.poppinsRegular,),) ,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyishBlack)),
            ),
          ),
          SizedBox(height: Get.height*0.006),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(CupertinoIcons.delete, color: AppColors.red),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
