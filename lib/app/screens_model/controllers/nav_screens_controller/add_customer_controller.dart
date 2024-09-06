import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/customer_model.dart';
import '../../../utils/utils.dart';
import 'customer_controller.dart';

class AddCustomerController extends GetxController {
  final fullName = TextEditingController().obs;
  final email = TextEditingController().obs;
  final phoneNumber = TextEditingController().obs;
  final source = TextEditingController().obs;
  final addedBy = TextEditingController().obs;
  final branch = TextEditingController().obs;
  final address = TextEditingController().obs;
  final nameFocus = FocusNode().obs;
  final emailFocus = FocusNode().obs;
  final phoneNumberFocus = FocusNode().obs;
  final sourceFocus = FocusNode().obs;
  final addedByFocus = FocusNode().obs;
  final branchFocus = FocusNode().obs;
  final addressFocus = FocusNode().obs;
  void addNewCustomer() {
    if (areFieldEmpty()) {
      final customerController = Get.find<CustomerController>();

      Customer newCustomer = Customer(
        name: fullName.value.text,
        email: email.value.text,
        date:
            '${DateTime.now().day} ${DateTime.now().month}, ${DateTime.now().year}',
        phoneNumber: phoneNumber.value.text,
        source: source.value.text,
        addedBy: addedBy.value.text,
        branch: branch.value.text,
        address: address.value.text,
        crewLeader: '',
        type: '',
        scheduler: '',
        company: '',
        projectName: '',
        projectNumber: '',
        projectType: '',
        buildingType: '',
        addressTwo: '',
        city: '',
        state: '',
        zipCode: '',
        tax: '',
        potential: '',
        note: '',
        owner: '',
      );

      _onSubmittedChanges();
      // Add the new customer to the list
      customerController.customers.add(newCustomer);
    } else {
      Utils.showErrorSnackBar(
          'InSufficient Data', 'Must need to fill all the field.');
    }
  }

  bool areFieldEmpty() {
    return fullName.value.text.isNotEmpty &&
        email.value.text.isNotEmpty &&
        phoneNumber.value.text.isNotEmpty &&
        source.value.text.isNotEmpty &&
        addedBy.value.text.isNotEmpty &&
        branch.value.text.isNotEmpty &&
        address.value.text.isNotEmpty;
  }

  void _onSubmittedChanges() {
    fullName.value.clear();
    email.value.clear();
    phoneNumber.value.clear();
    source.value.clear();
    addedBy.value.clear();
    branch.value.clear();
    address.value.clear();
    Utils.showSnackBar(
      'Updated',
      'New Customer added successfully',
    );
  }
}
