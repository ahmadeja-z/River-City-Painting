import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';
import 'package:painting/app/controllers/nav_screens_controller/estimates_controllers/todos_controller_info_estimates.dart';
import 'package:painting/app/utils/utils.dart';

import '../../../../resources/components/nav_bar_screens_widgets/todo_widget _estimates.dart';

class ToDosInfoEstimatesView extends StatelessWidget {
  const ToDosInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(ToDosControllerEstimates());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          CustomHeaderContainer(
            title: 'To-Dos',
            onTap: todoController.showDialog,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todos[index];
                  return ToDoItemWidget(
                    title: todo['title'] ?? 'No Title',
                    assignedTo: todo['assignedTo'] ?? 'N/A',
                    startDate: todo['startDate'] ?? 'N/A',
                    endDate: todo['endDate'] ?? 'N/A',
                    note: todo['note'] ?? 'N/A',
                    onDelete: () {
                      Utils.showDeletionDialog('To-Do', () {
                        todoController.removeTodoAt(index);
                        Get.back();
                        Utils.showSnackBar(
                            'Success!', 'To-Do is successfully deleted');
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
