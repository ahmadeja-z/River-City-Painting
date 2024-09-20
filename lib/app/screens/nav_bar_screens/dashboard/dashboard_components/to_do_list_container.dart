import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import '../../../../resources/app_colors/app_colors.dart';
import '../../../../controllers/nav_screens_controller/dashboard_controller.dart';
import '../../../../utils/utils.dart';

class ToDoListContainer extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  ToDoListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: Get.height * 0.4,
        width: Get.width * 0.94,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'To do List',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryRed,
                fontFamily: AppFonts.poppinsRegular,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(),
            SizedBox(height: Get.height * 0.01),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primaryRed,
                    controller: controller.toDoController.value,
                    style: const TextStyle(
                      fontFamily: AppFonts.robotoRegular,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration:  InputDecoration(
                      hintText: 'Add a new...',
                      hintStyle: TextStyle(fontFamily: AppFonts.poppinsRegular,),
                      contentPadding: EdgeInsets.only(left: Get.width*0.05),
                    ),
                  ),
                ),
                 SizedBox(width: Get.width*0.03),
                GestureDetector(
                  onTap: () {
                    final text = controller.toDoController.value.text;
                    if (text.isNotEmpty) {
                      controller.addToDo(text);
                      controller.toDoController.value.clear();
                    } else {
                      Utils.showErrorSnackBar('Invalid Input', 'Please enter a to-do item!');
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Get.width*0.01,vertical: Get.width*0.01),
 decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 22, // Increased icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                return controller.toDoList.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(128.0),
                      child: const Center(child: Text('Add new to-do')),
                    )
                    : Scrollbar(
                  thickness: 6.0,
                  radius: const Radius.circular(10),
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: controller.toDoList.length,
                    itemBuilder: (context, index) {
                      final todos = controller.toDoList[index];
                      return _listTile(
                        Checkbox(
                          activeColor: AppColors.primaryRed,
                          value: todos.isDone,
                          onChanged: (value) {
                            controller.upDateTodoStatus(index, value!);
                           todos.isDone? Utils.showSnackBar('Successfully', 'Todo successfully Completed'):Utils.showErrorSnackBar('Unsuccessfully', 'Todo are not completed yet');
                          },
                        ),
                        Text(
                          todos.title ?? 'NoTitle',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.poppinsRegular,
                            fontSize: 17,
                            color: todos.isDone?AppColors.primaryRed:AppColors.black,
                            decoration: todos.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.delete,
                            color: AppColors.primaryRed,
                          ),
                          onPressed: () {
                           Utils.showDeletionDialog('Todo', (){ controller.deleteToDoAt(index);});
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(Widget leading, Widget title, Widget trailing) {
    return Row(
      children: [
        leading,
        title,
        const Spacer(),
        trailing,
      ],
    );
  }
}
