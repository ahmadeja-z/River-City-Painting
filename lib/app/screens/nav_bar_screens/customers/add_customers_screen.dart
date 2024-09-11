import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/customized_button.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_info_field.dart';
import 'package:painting/app/screens_model/controllers/nav_screens_controller/add_customer_controller.dart';
import 'package:painting/app/screens_model/controllers/nav_screens_controller/customer_controller.dart'; // Import CustomerController

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/components/nav_bar_screens_widgets/custom_app_bar.dart';

class AddCustomers extends StatelessWidget {
  const AddCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    final addCustomerController = Get.put(AddCustomerController());

    Get.lazyPut(() => CustomerController());

    TextStyle fontStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppinsRegular,
    );

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: AppColors.primaryRed,
            )),
        title: const Text(
          'Add Customer',
          style: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryRed,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name', style: fontStyle),
              CustomInfoTextField(
                currentFocus: addCustomerController.nameFocus.value,
                nextFocus: addCustomerController.emailFocus.value,
                hintText: 'Enter Full Name',
                controller: addCustomerController.fullName.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Email', style: fontStyle),
              CustomInfoTextField(
                keyBoardType: TextInputType.emailAddress,
                currentFocus: addCustomerController.emailFocus.value,
                nextFocus: addCustomerController.phoneNumberFocus.value,
                hintText: 'Enter Email',
                controller: addCustomerController.email.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Phone Number', style: fontStyle),
              CustomInfoTextField(
                keyBoardType: TextInputType.number,
                currentFocus: addCustomerController.phoneNumberFocus.value,
                nextFocus: addCustomerController.sourceFocus.value,
                hintText: 'Enter Phone Number',
                controller: addCustomerController.phoneNumber.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Source', style: fontStyle),
              CustomInfoTextField(
                currentFocus: addCustomerController.sourceFocus.value,
                nextFocus: addCustomerController.addedByFocus.value,
                hintText: 'Enter Source',
                controller: addCustomerController.source.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Added By', style: fontStyle),
              CustomInfoTextField(
                currentFocus: addCustomerController.addedByFocus.value,
                nextFocus: addCustomerController.branchFocus.value,
                hintText: 'Enter Full Name',
                controller: addCustomerController.addedBy.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Branch', style: fontStyle),
              CustomInfoTextField(
                currentFocus: addCustomerController.branchFocus.value,
                nextFocus: addCustomerController.addressFocus.value,
                hintText: 'Enter Branch',
                controller: addCustomerController.branch.value,
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Address', style: fontStyle),
              CustomInfoTextField(
                currentFocus: addCustomerController.addressFocus.value,
                hintText: 'Enter Address',
                controller: addCustomerController.address.value,
              ),
              SizedBox(height: Get.height * 0.07),
              CustomizedButton(
                onPress: () {
                  addCustomerController.addNewCustomer();
                },
                title: 'Add Customer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
