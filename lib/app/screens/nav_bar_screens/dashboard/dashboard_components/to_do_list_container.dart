import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import '../../../../resources/app_colors/app_colors.dart';
import '../../../../screens_model/controllers/nav_screens_controller/dashboard_controller.dart';

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
          boxShadow: const[
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 6,
              offset:  Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To do List',
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.poppinsRegular,
                fontWeight: FontWeight.w600,
              ),
            )
            ,
            SizedBox(height: Get.height*0.01,),
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
                    decoration: const InputDecoration(
                      hintText: 'Add a new',
                      contentPadding: EdgeInsets.only(left: 25),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    controller.addToDo(controller.toDoController.value.text);
                    controller.toDoController.value.clear();
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 18,
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
                    ? const Center(child: Text('Add new to-do'))
                    : Scrollbar(
                  thickness: 6.0,
                  radius: const Radius.circular(10),
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: controller.toDoList.length,
                    itemBuilder: (context, index) {
                      final todos = controller.toDoList[index];
                      return _listTile(Checkbox(
                        activeColor: AppColors.primaryRed,
                        value: todos.isDone,
                        onChanged: (value) {
                          controller.upDateTodoStatus(index, value!);
                        },
                      ),
                        Text(
                        todos.title ?? 'NoTitle',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.robotoRegular,
                          fontSize: 17,
                          decoration: todos.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ), IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.deleteToDoAt(index);
                        },
                      ),);
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
  Widget _listTile(Widget leading,Widget title,Widget trailing){
    return Row(
      children: [
        leading,title,const Spacer(),trailing

      ],
    );
  }
}
