import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';
import '../../../../utils/utils.dart';

class NotesControllerEstimates extends GetxController {
  final noteController =
      TextEditingController().obs; // TextEditingController to handle note input
  final notesList = <String>['Nothing','Completed'].obs; // Reactive list of notes

  // Function to show dialog for adding a note
  void showAddNoteDialog() {
    noteController.value.clear(); // Clear the text field
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Add Note',
          style: TextStyle(
              color: AppColors.primaryRed, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: Get.height * 0.1,
          width: Get.width * 0.4,
          child: TextField(
            controller: noteController.value,
            maxLines: 4,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Add Note...',
              border: OutlineInputBorder(),
            ),
          ),
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
              onSave();
            },
            color: AppColors.primaryRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  // Function to show dialog for editing a note
  void showEditNoteDialog(int index) {
    noteController.value.text =
        notesList[index]; // Pre-fill with the existing note
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Edit Note',
          style: TextStyle(
              color: AppColors.primaryRed, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: Get.height * 0.1,
          width: Get.width * 0.4,
          child: TextField(
            controller: noteController.value,
            maxLines: 4,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Edit Note...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        actions: [
          CustomIconButton(
            title: 'Cancel',
            onTap: () => Get.back(),
            color: Colors.transparent,
            textColor: AppColors.primaryRed,
          ),
          CustomIconButton(
            title: 'Update',
            onTap: () {
              if (noteController.value.text.isNotEmpty) {
                notesList[index] = noteController.value.text; // Update the note
                Get.back();
                Utils.showSnackBar('Success', 'Note Updated');

              } else {
                Utils.showErrorSnackBar(
                    'Warning', 'The note field is required');
              }
            },
            color: AppColors.primaryRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void onSave() {
    if (noteController.value.text.isNotEmpty) {
      notesList.add(noteController.value.text);
      Get.back();
      Utils.showSnackBar('Success', 'Note Added');
       noteController.value.clear();
    } else {
      Utils.showErrorSnackBar('Warning', 'The note field is required');
    }
  }

  // Function to delete a note
  void deleteNoteAt(int index) {
    notesList.removeAt(index);
    Utils.showSnackBar('Deleted', 'Note has been deleted');
  }
}
