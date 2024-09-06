import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/customer_model.dart';
import '../../../utils/utils.dart';
import 'customer_controller.dart';

class AddEstimatesController extends GetxController {
  // TextEditingControllers
  final fullNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final companyController = TextEditingController().obs;
  final projectNameController = TextEditingController().obs;
  final projectNumberController = TextEditingController().obs;
  final projectTypeController = TextEditingController().obs;
  final buildingTypeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final addressTwoController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;
  final branchController = TextEditingController().obs;
  final taxController = TextEditingController().obs;
  final potentialController = TextEditingController().obs;
  final noteController = TextEditingController().obs;
  final sourceController = TextEditingController().obs;
  final ownerController = TextEditingController().obs;

  // FocusNodes
  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final companyFocusNode = FocusNode();
  final projectNameFocusNode = FocusNode();
  final projectNumberFocusNode = FocusNode();
  final projectTypeFocusNode = FocusNode();
  final buildingTypeFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final addressTwoFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final stateFocusNode = FocusNode();
  final zipCodeFocusNode = FocusNode();
  final branchFocusNode = FocusNode();
  final taxFocusNode = FocusNode();
  final potentialFocusNode = FocusNode();
  final noteFocusNode = FocusNode();
  final sourceFocusNode = FocusNode();
  final ownerFocusNode = FocusNode();

  // Dropdown options
  RxList<String> owners = [
    'John Smith',
    'Sarah Johnson',
    'Michael Brown',
    'Emily Davis',
    'David Wilson',
    'Jessica Taylor',
    'Daniel Martinez',
    'Laura Anderson',
    'James Thomas',
    'Olivia Lee',
  ].obs;

  RxList<String> branches = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Miami',
    'San Francisco',
    'Boston',
    'Seattle',
    'Denver',
    'Atlanta',
  ].obs;

  RxList<String> buildingTypes = [
    'Residential',
    'Commercial',
    'Industrial',
    'Mixed-Use',
    'Institutional',
    'Retail',
    'Office',
    'Hospitality',
    'Government',
    'Warehouse',
  ].obs;

  // Method to check if all fields are filled
  bool areFieldsFilled() {
    return fullNameController.value.text.isNotEmpty &&
        emailController.value.text.isNotEmpty &&
        phoneNumberController.value.text.isNotEmpty &&
        buildingTypeController.value.text.isNotEmpty &&
        cityController.value.text.isNotEmpty &&
        stateController.value.text.isNotEmpty &&
        zipCodeController.value.text.isNotEmpty &&
        branchController.value.text.isNotEmpty &&
        taxController.value.text.isNotEmpty &&
        potentialController.value.text.isNotEmpty &&
        ownerController.value.text.isNotEmpty;
  }

  // Method to handle form submission and clear fields
  void submitEstimate() {
    if (areFieldsFilled()) {
      final customerController = Get.find<CustomerController>();

      Customer newCustomer = Customer(
        name: fullNameController.value.text,
        email: emailController.value.text,
        date:
            '${DateTime.now().day} ${DateTime.now().month}, ${DateTime.now().year}',
        phoneNumber: phoneNumberController.value.text,
        source: sourceController.value.text,
        addedBy:
            ownerController.value.text, // Assuming addedBy is the same as owner
        branch: branchController.value.text,
        address: addressController.value.text,
        crewLeader: '',
        type: '',
        scheduler: '',

        company: companyController.value.text,
        projectName: projectNameController.value.text,
        projectNumber: projectNumberController.value.text,
        projectType: projectTypeController.value.text,
        buildingType: buildingTypeController.value.text,
        addressTwo: addressTwoController.value.text,
        city: cityController.value.text,
        state: stateController.value.text,
        zipCode: zipCodeController.value.text,
        tax: taxController.value.text,
        potential: potentialController.value.text,
        note: noteController.value.text,
        owner: ownerController.value.text,
      );

      _onSubmittedChanges();
      // Add the new customer to the list
      customerController.customers.add(newCustomer);
      Utils.showSnackBar('Success', 'Estimate added successfully');
    } else {
      Utils.showErrorSnackBar('Insufficient Requirements', 'Fill all the required Field');
    }
  }

  // Method to clear fields
  void _onSubmittedChanges() {
    fullNameController.value.clear();
    emailController.value.clear();
    phoneNumberController.value.clear();
    companyController.value.clear();
    projectNameController.value.clear();
    projectNumberController.value.clear();
    projectTypeController.value.clear();
    buildingTypeController.value.clear();
    addressController.value.clear();
    addressTwoController.value.clear();
    cityController.value.clear();
    stateController.value.clear();
    zipCodeController.value.clear();
    branchController.value.clear();
    taxController.value.clear();
    potentialController.value.clear();
    noteController.value.clear();
    sourceController.value.clear();
    ownerController.value.clear();
  }

  @override
  void onClose() {
    // Dispose of the controllers and focus nodes when the controller is disposed
    fullNameController.value.dispose();
    emailController.value.dispose();
    phoneNumberController.value.dispose();
    companyController.value.dispose();
    projectNameController.value.dispose();
    projectNumberController.value.dispose();
    projectTypeController.value.dispose();
    buildingTypeController.value.dispose();
    addressController.value.dispose();
    addressTwoController.value.dispose();
    cityController.value.dispose();
    stateController.value.dispose();
    zipCodeController.value.dispose();
    branchController.value.dispose();
    taxController.value.dispose();
    potentialController.value.dispose();
    noteController.value.dispose();
    sourceController.value.dispose();
    ownerController.value.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    companyFocusNode.dispose();
    projectNameFocusNode.dispose();
    projectNumberFocusNode.dispose();
    projectTypeFocusNode.dispose();
    buildingTypeFocusNode.dispose();
    addressFocusNode.dispose();
    addressTwoFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    zipCodeFocusNode.dispose();
    branchFocusNode.dispose();
    taxFocusNode.dispose();
    potentialFocusNode.dispose();
    noteFocusNode.dispose();
    sourceFocusNode.dispose();
    ownerFocusNode.dispose();

    super.onClose();
  }
}
