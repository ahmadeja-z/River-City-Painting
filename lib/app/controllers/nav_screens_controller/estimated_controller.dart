import 'package:get/get.dart';
import 'package:painting/app/models/customer_model.dart';
import 'package:painting/app/controllers/nav_screens_controller/customer_controller.dart';

class EstimatedController extends GetxController {
  // Access CustomerController instance
  final customerController = Get.put(CustomerController());

  // Observable variable for the search query
  var searchQuery = ''.obs;

  // Method to filter customers based on search query
  List<Customer> get filteredCustomers {
    if (searchQuery.value.isEmpty) {
      return customerController.customers;
    }
    return customerController.customers.where((customer) {
      final query = searchQuery.value.toLowerCase();
      return customer.name.toLowerCase().contains(query) ||
          customer.email.toLowerCase().contains(query) ||
          customer.phoneNumber.contains(query) ||
          customer.type.toLowerCase().contains(query) ||
          customer.crewLeader.toLowerCase().contains(query) ||
          customer.address.toLowerCase().contains(query) ||
          customer.branch.toLowerCase().contains(query) ||
          customer.scheduler.toLowerCase().contains(query);
    }).toList();
  }
}
