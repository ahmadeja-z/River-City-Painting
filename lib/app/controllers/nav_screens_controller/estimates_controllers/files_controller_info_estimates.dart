import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';
import 'package:painting/app/utils/utils.dart';

class FilesControllerEstimates extends GetxController {
  Rx<File?> pickedFile = Rx<File?>(null);
  RxList<String> filesList = <String>[].obs; // List of file paths as Strings

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        pickedFile.value = File(result.files.single.path!);
      } else {
        Utils.showErrorSnackBar('Invalid Credentials', 'No file selected');
      }
    } catch (e) {
      Utils.showErrorSnackBar('Error', e.toString());
      print('Error picking file: $e');
    }
  }

  void showDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Files',
          style: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryRed,
          ),
        ),
        content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            SizedBox(height: Get.height*0.01,),
            Container(
              width: Get.width * 0.8, // Responsive width
              height: Get.height * 0.05, // Responsive height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Get.width * 0.02), // Responsive border radius
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Get.width * 0.01), // Responsive padding
                    child: GestureDetector(
                      onTap: () {
                        pickFile();
                      },
                      child: Container(
                        height: Get.height * 0.06, // Responsive height
                        width: Get.width * 0.25, // Responsive width
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                Get.width * 0.02), // Responsive border radius
                            bottomLeft: Radius.circular(
                                Get.width * 0.02), // Responsive border radius
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Choose File',
                            style: TextStyle(
                              fontFamily: AppFonts.poppinsRegular,
                              color: Colors.white,
                              fontSize: Get.width * 0.03, // Responsive font size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Text(
                        pickedFile.value != null
                            ? pickedFile.value!.path.split('/').last
                            : 'No File Chosen',
                        style: TextStyle(
                          fontFamily: AppFonts.poppinsRegular,
                          fontSize: Get.width * 0.03, // Responsive font size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            title: 'Cancel',
            onTap: () => Get.back(),
            color: Colors.transparent,
            textColor: AppColors.primaryRed,
          ),
          CustomIconButton(
            title: 'Save',
            onTap: () {
              if (pickedFile.value != null) {
                filesList.add(pickedFile.value!.path);
                Get.back();
                Utils.showSnackBar('Success', 'File uploaded successfully ');
                print('Files List: $filesList'); // Log the updated filesList
              } else {
                Utils.showErrorSnackBar(
                    'Warning', 'The upload file is required');
              }
            },
            color: AppColors.primaryRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
