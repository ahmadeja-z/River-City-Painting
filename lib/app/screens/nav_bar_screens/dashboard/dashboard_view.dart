import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/info_container.dart';
import 'package:painting/app/screens/nav_bar_screens/dashboard/dashboard_components/to_do_list_container.dart';
import 'package:painting/app/screens/nav_bar_screens/dashboard/dashboard_components/schedules_container.dart';
import '../../../resources/assets/app_icons.dart';
import '../../../controllers/nav_screens_controller/dashboard_controller.dart';
import 'dashboard_components/order_container.dart';
import 'dashboard_components/order_summary_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoContainer(
                        title: 'Total Customers',
                        imageIcon: AppIcons.info1,
                        total: dashboardController.totalCustomer.value),
                    InfoContainer(
                        title: 'Total Staff',
                        imageIcon: AppIcons.info2,
                        total: dashboardController.totalStuff.value)
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoContainer(
                        title: 'Total Orders',
                        imageIcon: AppIcons.info3,
                        total: dashboardController.totalOrders.value),
                    InfoContainer(
                        title: 'Total Revenue',
                        imageIcon: AppIcons.info4,
                        total: dashboardController.totalRevenue.value)
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const OrderSummaryContainer(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              OrdersWidget(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ToDoListContainer(),
              SizedBox(
                height: Get.height * 0.02,
              ),
             Container(
               padding: const EdgeInsets.all(15),
               height: Get.height * 0.5,
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
               child:  SchedulesView(),
             ),
              SizedBox(height: Get.height*0.15)
            ],
          ),
        ),
      ),
    );
  }
}
