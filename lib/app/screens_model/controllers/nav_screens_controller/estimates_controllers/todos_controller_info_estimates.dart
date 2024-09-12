import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_info_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';
import '../../../../resources/components/nav_bar_screens_widgets/custom_todo_field.dart';
import '../../../../resources/components/nav_bar_screens_widgets/date_picker_field.dart';
import '../../../../utils/utils.dart';

class ToDosControllerEstimates extends GetxController {
  final TextStyle fontStyle = TextStyle(
    fontFamily: AppFonts.poppinsRegular,
  );

  // Controllers
  final titleController = TextEditingController().obs;
  final userController = TextEditingController().obs;
  final startDate = TextEditingController().obs;
  final endDate = TextEditingController().obs;
  final noteController = TextEditingController().obs;

  // List to store todos
  final RxList<Map<String, String>> todos = <Map<String, String>>[].obs;

  // List of admin users
  final List<String> adminUsers = [
    'Sufyan Amir',
    'Tony Lynch',
    'Samantha Maghe',
    'Leah Alvarez',
    'Brittan Houser',
    'Jim Housen',
    'Coby Houser',
    'Adam Koenig',
    'Noman Anmad',
    'Burhan Scheduler',
    'Ammar Crew',
  ];

  // Method to show dialog
  void showDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Add To-Dos',
          style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              color: AppColors.primaryRed,
              fontWeight: FontWeight.w600),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: fontStyle),
              CustomToDoField(
                hintText: 'Title',
                controller: titleController.value,
              ),
              SizedBox(height: Get.height * 0.01),
              Text('Who:', style: fontStyle),
              CustomToDoField(
                hintText: 'Admin',
                controller: userController.value,
                dropDownItems: adminUsers,
              ),
              SizedBox(height: Get.height * 0.01),
              Text('When Should it be completed?', style: fontStyle),
              SizedBox(height: Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Date:', style: fontStyle),
                      DatePickerField(controller: startDate.value),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Date:', style: fontStyle),
                      DatePickerField(controller: endDate.value),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Text('Add Note', style: fontStyle),
              SizedBox(
                height: Get.height * 0.1,
                width: Get.width * 0.7,
                child: TextField(
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: AppFonts.poppinsRegular,
                  ),
                  controller: noteController.value,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Add Note...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          CustomIconButton(
            title: 'Cancel',
            onTap: () => Get.back(), // Close the dialog on cancel
            color: Colors.transparent,
            textColor: AppColors.primaryRed,
          ),
          CustomIconButton(
            title: 'Save',
            onTap: () {
              saveToDo();
              print(todos);
            },
            color: AppColors.primaryRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  // Method to remove a todo item at a specific index
  void removeTodoAt(int index) {
    todos.removeAt(index);
  }

  // Method to save a new todo item
  void saveToDo() {
    if (titleController.value.text.isNotEmpty &&
        userController.value.text.isNotEmpty &&
        startDate.value.text.isNotEmpty &&
        endDate.value.text.isNotEmpty &&
        noteController.value.text.isNotEmpty) {
      todos.add({
        'title': titleController.value.text,
        'user': userController.value.text,
        'startDate': startDate.value.text,
        'endDate': endDate.value.text,
        'note': noteController.value.text,
      });
      // Clear the controllers after saving
      titleController.value.clear();
      userController.value.clear();
      startDate.value.clear();
      endDate.value.clear();
      noteController.value.clear();
      Get.back();
      Utils.showSnackBar('Success', 'To-Do added successfully!');
    } else {
      Utils.showErrorSnackBar('Warning', 'Please fill all fields');
    }
  }
}
