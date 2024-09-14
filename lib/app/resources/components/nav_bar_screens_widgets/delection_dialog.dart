import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        TextButton(
          onPressed: () => Get.back(), // Close dialog on cancel
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // Call the confirm callback on deletion
            Get.back(); // Close dialog after deletion
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
