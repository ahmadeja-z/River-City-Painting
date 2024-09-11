import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/screens_model/controllers/nav_screens_controller/schedule_controller.dart';
import '../../../../resources/app_colors/app_colors.dart';
import '../../../../resources/components/nav_bar_screens_widgets/schedule_tile.dart';
import '../../../../resources/components/nav_bar_screens_widgets/search_text_field.dart'; // Import the SearchTextField widget

class SchedulesView extends StatelessWidget {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SchedulesController());

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Schedules',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: AppFonts.poppinsRegular,fontSize: 22,color: AppColors.primaryRed),),
          const Divider(),
          SizedBox(height: Get.height*0.02,),
          SearchTextField(
            textController: TextEditingController(),
            onChanged: (value) => controller.filterSchedules(value), // Call the correct method
            hintText: 'Search Customer...',
          ),
          SizedBox(height: Get.height * 0.02),
          Expanded(
            child: Obx(() {
              return Scrollbar(
                child: ListView.builder(
                  itemCount: controller.filteredNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: ScheduleTile(
                        title: controller.filteredNames[index],
                        address: controller.filteredAddresses[index],
                        schedule: controller.filteredSchedulers[index],
                        scheduleId: controller.filteredSchedulerIds[index],
                        date: controller.filteredDates[index],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
