import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../screens_model/controllers/nav_screens_controller/estimates_controllers/items_controller_info_estimates.dart';

class DropdownTextFieldScreen extends StatelessWidget {
  final ItemsControllerEstimates controller = Get.put(ItemsControllerEstimates());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown TextField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Obx(() => TextField(
                controller: TextEditingController(text: controller.selectedItem.value),
                decoration: InputDecoration(
                  labelText: 'Select an Option',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      controller.showDropdownMenu(context);  // Call the dropdown function
                    },
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

