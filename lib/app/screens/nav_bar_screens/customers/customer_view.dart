import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/customer_tile.dart';

import '../../../models/customer_model.dart';
import '../../../resources/components/nav_bar_screens_widgets/customer_info_alert.dart';
import '../../../resources/components/nav_bar_screens_widgets/search_text_field.dart';
import '../../../screens_model/controllers/nav_screens_controller/customer_controller.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerController());

    void showCustomerDetails(Customer customer) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomerDetailsDialog(
            customerName: customer.name,
            customerEmail: customer.email,
            date: customer.date,
            phoneNumber: customer.phoneNumber,
            source: customer.source,
            addedBy: customer.addedBy,
            branch: customer.branch,
            address: customer.address,
          );
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height*0.02,),
          SearchTextField(
            textController: TextEditingController(),
            onChanged: (value) => controller.filterCustomers(value),
            hintText: 'Search Customer by Name...',
          ),
          SizedBox(height: Get.height * 0.02),
          Expanded( // This makes the ListView scrollable
            child: Obx(
                  () {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: controller.filteredCustomers.length,
                    itemBuilder: (context, index) {
                      final customer = controller.filteredCustomers[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: CustomerTile(
                          customerName: customer.name,
                          onClick: () {
                            showCustomerDetails(customer);
                          },
                          customerEmail: customer.email,
                          onEditTap: () {},
                          onDeleteTap: () {
                            Get.defaultDialog(
                              titlePadding: const EdgeInsets.only(top: 20),
                              title: 'Delete',
                              titleStyle: const TextStyle(
                                  fontFamily: AppFonts.poppinsRegular,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryRed),
                              contentPadding: const EdgeInsets.all(20),
                              content: const Text(
                                  'Are you sure you want to delete this Customer?'),
                              confirm: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 40),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.deleteCustomer(customer);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryRed,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              cancel: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('No'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
