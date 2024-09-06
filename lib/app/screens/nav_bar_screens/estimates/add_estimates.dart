import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/customized_button.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/assets/app_fonts.dart';
import '../../../resources/components/nav_bar_screens_widgets/custom_info_field.dart';
import '../../../screens_model/controllers/nav_screens_controller/add_estimates_controller.dart';

class AddEstimates extends StatefulWidget {
  const AddEstimates({super.key});

  @override
  State<AddEstimates> createState() => _AddEstimatesState();
}

class _AddEstimatesState extends State<AddEstimates> {
  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppinsRegular,
    );

    final addEstimatesController = Get.put(AddEstimatesController());

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
            'Estimates',
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.poppinsRegular,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryRed,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Full Name', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.fullNameFocusNode,
                  nextFocus: addEstimatesController.emailFocusNode,
                  hintText: 'Enter Full Name',
                  controller: addEstimatesController.fullNameController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Email', style: fontStyle),
                CustomInfoTextField(
                  keyBoardType: TextInputType.emailAddress,
                  currentFocus: addEstimatesController.emailFocusNode,
                  nextFocus: addEstimatesController.phoneNumberFocusNode,
                  hintText: 'Enter Email',
                  controller: addEstimatesController.emailController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Phone Number', style: fontStyle),
                CustomInfoTextField(
                  keyBoardType: TextInputType.number,
                  currentFocus: addEstimatesController.phoneNumberFocusNode,
                  nextFocus: addEstimatesController.companyFocusNode,
                  hintText: 'Enter Phone Number',
                  controller: addEstimatesController.phoneNumberController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Company Name (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.companyFocusNode,
                  nextFocus: addEstimatesController.projectNameFocusNode,
                  hintText: 'Enter Company',
                  controller: addEstimatesController.companyController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Project Name (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.projectNameFocusNode,
                  nextFocus: addEstimatesController.projectNumberFocusNode,
                  hintText: 'Enter Project Name',
                  controller: addEstimatesController.projectNameController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Project Number (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.projectNumberFocusNode,
                  nextFocus: addEstimatesController.projectTypeFocusNode,
                  hintText: 'Enter Project Number',
                  controller:
                      addEstimatesController.projectNumberController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Project Type (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.projectTypeFocusNode,
                  nextFocus: addEstimatesController.buildingTypeFocusNode,
                  hintText: 'Enter Project Type',
                  controller: addEstimatesController.projectTypeController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Building Type', style: fontStyle),
                CustomInfoTextField(
                  dropDownItems: addEstimatesController.buildingTypes,
                  currentFocus: addEstimatesController.buildingTypeFocusNode,
                  nextFocus: addEstimatesController.addressFocusNode,
                  hintText: 'Enter Building Type',
                  controller: addEstimatesController.buildingTypeController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Address', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.addressFocusNode,
                  nextFocus: addEstimatesController.addressTwoFocusNode,
                  hintText: 'Enter Address',
                  controller: addEstimatesController.addressController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Address 2 (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.addressTwoFocusNode,
                  nextFocus: addEstimatesController.cityFocusNode,
                  hintText: 'Enter Address Line 2',
                  controller: addEstimatesController.addressTwoController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('City', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.cityFocusNode,
                  nextFocus: addEstimatesController.stateFocusNode,
                  hintText: 'Enter City',
                  controller: addEstimatesController.cityController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('State', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.stateFocusNode,
                  nextFocus: addEstimatesController.zipCodeFocusNode,
                  hintText: 'Enter State',
                  controller: addEstimatesController.stateController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Zip Code', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.zipCodeFocusNode,
                  nextFocus: addEstimatesController.branchFocusNode,
                  hintText: 'Enter Zip Code',
                  controller: addEstimatesController.zipCodeController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Branch', style: fontStyle),
                CustomInfoTextField(
                  dropDownItems: addEstimatesController.branches,
                  currentFocus: addEstimatesController.branchFocusNode,
                  nextFocus: addEstimatesController.taxFocusNode,
                  hintText: 'Enter Branch',
                  controller: addEstimatesController.branchController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Tax', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.taxFocusNode,
                  nextFocus: addEstimatesController.potentialFocusNode,
                  hintText: 'Enter Tax',
                  controller: addEstimatesController.taxController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Potential', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.potentialFocusNode,
                  nextFocus: addEstimatesController.noteFocusNode,
                  hintText: 'Enter Potential',
                  controller: addEstimatesController.potentialController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Note (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.noteFocusNode,
                  nextFocus: addEstimatesController.sourceFocusNode,
                  hintText: 'Enter Note',
                  controller: addEstimatesController.noteController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Source (Optional)', style: fontStyle),
                CustomInfoTextField(
                  currentFocus: addEstimatesController.sourceFocusNode,
                  nextFocus: addEstimatesController.ownerFocusNode,
                  hintText: 'Enter Source',
                  controller: addEstimatesController.sourceController.value,
                ),
                SizedBox(height: Get.height * 0.02),
                Text('Owner', style: fontStyle),
                CustomInfoTextField(
                  dropDownItems: addEstimatesController.owners,
                  currentFocus: addEstimatesController.ownerFocusNode,
                  hintText: 'Enter Owner',
                  controller: addEstimatesController.ownerController.value,
                ),
                SizedBox(height: Get.height * 0.05),
                 CustomizedButton(title: 'Add Estimates',
                onPress: (){addEstimatesController.submitEstimate();},),
                SizedBox(height: Get.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
