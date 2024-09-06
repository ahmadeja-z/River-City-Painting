
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/screens_model/controllers/nav_screens_controller/contact_estimates_info_controller.dart';

import '../../../../resources/components/nav_bar_screens_widgets/contacts_estimates_info_tile.dart';
import '../../../../resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

class ContactsInfoEstimatesView extends StatelessWidget {
  const ContactsInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsEstimatesInfoController controller = Get.put(ContactsEstimatesInfoController());

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          // Header with optional add/edit icon
          CustomHeaderContainer(
            title: 'Contacts',
            editAble: false,
            onTap: () {
              // Define what happens when the icon is tapped
            },
          ),
          SizedBox(height: Get.height * 0.01),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.contactsList.length,
              itemBuilder: (context, index) {
                var contact = controller.contactsList[index];
                return ContactsTileEstimatesInfo(
                  title: contact['title']!,
                  name: contact['name']!,
                  email: contact['email']!,
                  number: contact['number']!,
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
