import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_info_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_todo_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';

import '../../../resources/app_colors/app_colors.dart';

class EmailControllerEstimates extends GetxController {
  final selectEmail = TextEditingController().obs;
  final emailTitle = TextEditingController().obs;
  final emailReceiver = TextEditingController().obs;
  final emailSubject = TextEditingController().obs;
  final emailBody = TextEditingController().obs;
  TextStyle fontStyle = TextStyle(
    fontFamily: AppFonts.poppinsRegular,
    color: AppColors.black,
  );
  void showEmailDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Add Emails',style: TextStyle(fontFamily: AppFonts.poppinsRegular,fontWeight: FontWeight.bold,color: AppColors.primaryRed),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 1,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                'Select Email:',
                style: fontStyle,
              ),
              CustomToDoField(
                hintText: 'Select Email',
                controller: selectEmail.value,
                dropDownItems: [
                  'email1@gamil.com',
                  'email2@gamil.com',
                  'email3@gmail.com'
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
                        'Email title',
                        style: fontStyle,
                      ),
                      SizedBox(
                        width: Get.width * 0.28,
                        child: CustomToDoField(
                            hintText: 'Email title',
                            controller: emailTitle.value),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email to:',
                        style: fontStyle,
                      ),
                      SizedBox(
                        width: Get.width * 0.28,
                        child: CustomToDoField(
                            keyBoardType: TextInputType.emailAddress,
                            hintText: 'Receiver',
                            controller: emailReceiver.value),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height*0.01,
              ),
              Text('Email Subject:',style: fontStyle,),
              SizedBox(
                height: Get.height * 0.06,
                width: Get.width * 0.9,
                child: TextField(
                  style: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13,),
                  controller: emailSubject.value,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Subject...',
                    hintStyle: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13,),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyishBlack)),
                  ),
                ),
              ),  SizedBox(
                height: Get.height*0.01,
              ),
              Text('Email body:',style: fontStyle,),
              SizedBox(
                height: Get.height * 0.08,
                width: Get.width * 0.9,
                child: TextField(
                  style: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13,),
                  controller: emailBody.value,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Body...',
                    hintStyle: TextStyle(fontFamily: AppFonts.poppinsRegular,fontSize: 13,),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyishBlack)),
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [CustomIconButton(title: 'cancel', onTap: (){}, color: AppColors.noColor, textColor: AppColors.primaryRed),
        CustomIconButton(title: 'Save', onTap: (){}, color: AppColors.primaryRed, textColor: AppColors.white)],
      ),
    );
  }
}
