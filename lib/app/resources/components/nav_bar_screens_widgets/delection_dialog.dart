import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';

class DeletionDialog extends StatelessWidget {
  final String itemName;
  final VoidCallback onConfirm;

  const DeletionDialog({super.key, required this.itemName, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: const Text(
        "Confirm Deletion",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("Are you sure you want to delete $itemName?"),
      actions: [
       CustomIconButton(title: 'cancel', onTap: (){Get.back();}, color: AppColors.noColor, textColor: AppColors.primaryRed),
       CustomIconButton(title: 'Delete', onTap: (){  onConfirm(); // Call the confirm callback on deletion
       Get.back(); }, color: AppColors.primaryRed, textColor: AppColors.white)
      ],
    );
  }
}
