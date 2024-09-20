import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';
import 'package:painting/app/utils/utils.dart';

class PhotosControllerEstimates extends GetxController {
  RxString imagePath = ''.obs; // Reactive path to hold the selected image
  RxList<String> images = <String>[].obs; // List to hold multiple images
  RxString selectedImage = ''.obs;

  // Function to show the image picker dialog
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
        children: [  Divider(),
          SizedBox(height: Get.height*0.01,),
          Obx(
                () => GestureDetector(
              onTap: () {
                pickImage(); // Trigger image picker when tapping the container
              },
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                 padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive border radius
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: imagePath.isNotEmpty
                        ? Image.file(
                      File(imagePath.value),
                      fit: BoxFit.cover, // Fit the image properly
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: Get.width * 0.1, // Responsive icon size
                        ),
                        SizedBox(height: Get.height * 0.01), // Spacing between icon and text
                        Text(
                          'Select file here to upload!',
                          style: TextStyle(
                            fontFamily: AppFonts.poppinsRegular,
                            fontSize: Get.width * 0.03, // Responsive text size
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02, // Spacing between elements
          ),
        ],
      ),
      actions: [
        CustomIconButton(
            title: 'Cancel',
            onTap: () {
              Get.back(); // Close the dialog on cancel
            },
            color: Colors.transparent,
            textColor: AppColors.primaryRed),
        CustomIconButton(
            title: 'Add image',
            onTap: () {
              if (imagePath.isNotEmpty) {
                images.add(imagePath.value); // Add image to the list
                Get.back(); // Close dialog after saving
                Utils.showSnackBar('Success', 'Image added successfully!');
              } else {
                Utils.showErrorSnackBar('Warning!', 'No image selected');
              }
            },
            color: AppColors.primaryRed,
            textColor: Colors.white)
      ],
    ));
  }

  // Function to pick an image from the gallery
  void pickImage() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path; // Set the selected image path
      } else {
        Utils.showErrorSnackBar('Warning!', 'No image selected');
      }
    } catch (e) {
      Utils.showErrorSnackBar('Error', e.toString());
      print(e.toString());
    }
  }
}
