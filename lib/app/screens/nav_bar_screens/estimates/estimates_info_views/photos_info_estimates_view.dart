import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

import '../../../../resources/components/nav_bar_screens_widgets/icon_button.dart';
import '../../../../screens_model/controllers/nav_screens_controller/estimates_controllers/photos_controller_info_estimates.dart';

class PhotosInfoEstimatesView extends StatelessWidget {
  const PhotosInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final photosController = Get.put(PhotosControllerEstimates());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: Get.height * 0.02), // Responsive height
              CustomHeaderContainer(
                title: 'Photos',
                onTap: () {
                  photosController.showImageDialog();
                },
              ),
              SizedBox(height: Get.height * 0.02), // Responsive height
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Obx(
                        () {
                      return GridView.builder(
                        itemCount: photosController.images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: Get.width * 0.02, // Responsive spacing
                          mainAxisSpacing: Get.width * 0.02, // Responsive spacing
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              photosController.selectedImage.value = photosController.images[index];
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive border radius
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Image.file(
                                File(photosController.images[index]),
                                fit: BoxFit.cover, // Ensures the image fits nicely within the container
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            return photosController.selectedImage.isNotEmpty
                ? GestureDetector(
              onTap: () {
                photosController.selectedImage.value = '';
              },
              child: Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.file(
                          File(photosController.selectedImage.value),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Get.width * 0.02),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomIconButton(title: 'Remove', onTap:  () {
                          photosController.images.remove(photosController.selectedImage.value);
                          photosController.selectedImage.value = ''; // Hide the image after removal
                        }, color: AppColors.primaryRed, textColor: Colors.white,



                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
