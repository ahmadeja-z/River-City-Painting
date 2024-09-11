import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';
import 'package:painting/app/utils/utils.dart';

class PhotosControllerEstimates extends GetxController {
  RxString imagePath = ''.obs;
  RxList<String> images = <String>[].obs;
  RxString selectedImage = ''.obs;

  void showImageDialog() {
    Get.dialog(AlertDialog(
      title: Text(
        'Pick an image',
        style: TextStyle(
          fontFamily: AppFonts.poppinsRegular,
          color: AppColors.primaryRed,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
                () => Container(
              height: Get.height * 0.2, // Adjusted to be more responsive
              width: Get.width * 0.7,   // Adjusted to be more responsive
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.05), // Responsive border radius
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Center(
                child: imagePath.isNotEmpty
                    ? Image.file(
                  File(imagePath.value),
                  fit: BoxFit.fitWidth,
                )
                    : Icon(
                  Icons.image_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02, // Adjusted to be more responsive
          ),
        ],
      ),
      actions: [
        CustomIconButton(title: 'Cancel', onTap: (){Get.back();}, color: Colors.transparent, textColor: AppColors.primaryRed),
      CustomIconButton(title: 'Add image', onTap: (){pickImage();}, color: AppColors.primaryRed, textColor: Colors.white)
      ],
    ));
  }

  void pickImage() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path;
        images.add(image.path); // Updated to be consistent with RxList<String>
      } else {
        Utils.showErrorSnackBar('Empty credentials', 'Image not selected');
      }
    } catch (e) {
      Utils.showErrorSnackBar('Invalid request', e.toString());
      print(e.toString());
    }
  }


}
