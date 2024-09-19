import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_profile_container.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/search_text_field.dart';
import 'package:painting/app/controllers/nav_screens_controller/estimated_controller.dart';

import 'estimates_info_tabs_screen.dart';

class EstimatesView extends StatelessWidget {
  const EstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final EstimatedController estimatedController = Get.put(EstimatedController());

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.02,),
            SearchTextField(
              textController: TextEditingController(),
              onChanged: (value) {
                estimatedController.searchQuery.value = value;
              },
            ),
            SizedBox(height: Get.height*0.02,),

            Obx(() {
              if (estimatedController.filteredCustomers.isEmpty) {
                return const Center(child: Text('No estimates available.'));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: estimatedController.filteredCustomers.length,
                  itemBuilder: (context, index) {

                    final customer = estimatedController.filteredCustomers[index];
                    return EstimatesProfileContainer(
                      status: 'status',
                      name: customer.name,
                      date: customer.date,
                      number: customer.phoneNumber,
                      type: customer.type,
                      crewLeader: customer.crewLeader,
                      address: customer.address,
                      branchName: customer.branch,
                      scheduler: customer.scheduler, onTileTap: (){Get.to(EstimatesInfoTabScreen());},
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
