import 'package:get/get.dart';

import '../../../models/customer_model.dart';

class CustomerController extends GetxController{
  var customers = <Customer>[
    Customer(
      name: 'Michael Johnson',
      email: 'michaeljohnson@gmail.com',
      date: '20 August, 2024',
      phoneNumber: '321-654-9870',
      source: 'Social Media',
      addedBy: 'Team Lead',
      branch: 'Chicago',
      address: '789 Maple St, Chicago, IL 60614',
    ),
    Customer(
      name: 'Emily Davis',
      email: 'emilydavis@gmail.com',
      date: '22 August, 2024',
      phoneNumber: '456-789-1230',
      source: 'Email',
      addedBy: 'Sales Rep',
      branch: 'San Francisco',
      address: '101 Pine St, San Francisco, CA 94105',
    ),
    Customer(
      name: 'Chris Wilson',
      email: 'chriswilson@gmail.com',
      date: '25 August, 2024',
      phoneNumber: '567-890-1234',
      source: 'Referral',
      addedBy: 'Marketing',
      branch: 'Seattle',
      address: '202 Oak St, Seattle, WA 98101',
    ),
    Customer(
      name: 'Olivia Brown',
      email: 'oliviabrown@gmail.com',
      date: '27 August, 2024',
      phoneNumber: '678-901-2345',
      source: 'Website',
      addedBy: 'Customer Service',
      branch: 'Houston',
      address: '303 Birch St, Houston, TX 77002',
    ),
    Customer(
      name: 'Ethan Miller',
      email: 'ethanmiller@gmail.com',
      date: '30 August, 2024',
      phoneNumber: '789-012-3456',
      source: 'Direct Call',
      addedBy: 'Admin',
      branch: 'Miami',
      address: '404 Cedar St, Miami, FL 33101',
    ),
    Customer(
      name: 'Sophia Martinez',
      email: 'sophiamartinez@gmail.com',
      date: '02 September, 2024',
      phoneNumber: '890-123-4567',
      source: 'Trade Show',
      addedBy: 'Exhibitor',
      branch: 'Boston',
      address: '505 Elm St, Boston, MA 02108',
    ),
    Customer(
      name: 'James Anderson',
      email: 'jamesanderson@gmail.com',
      date: '05 September, 2024',
      phoneNumber: '901-234-5678',
      source: 'Networking Event',
      addedBy: 'Business Development',
      branch: 'Philadelphia',
      address: '606 Walnut St, Philadelphia, PA 19103',
    ),
    Customer(
      name: 'Ava Thomas',
      email: 'avathomas@gmail.com',
      date: '08 September, 2024',
      phoneNumber: '012-345-6789',
      source: 'Advertising',
      addedBy: 'Creative Team',
      branch: 'Atlanta',
      address: '707 Pine St, Atlanta, GA 30303',
    ),
    Customer(
      name: 'Liam Jackson',
      email: 'liamjackson@gmail.com',
      date: '11 September, 2024',
      phoneNumber: '123-456-7891',
      source: 'Customer Referral',
      addedBy: 'Referral Program',
      branch: 'Denver',
      address: '808 Fir St, Denver, CO 80203',
    ),
    Customer(
      name: 'Mia White',
      email: 'miawhite@gmail.com',
      date: '14 September, 2024',
      phoneNumber: '234-567-8901',
      source: 'Online Form',
      addedBy: 'Online Support',
      branch: 'Dallas',
      address: '909 Spruce St, Dallas, TX 75201',
    ),
    Customer(
      name: 'Noah Lee',
      email: 'noahlee@gmail.com',
      date: '17 September, 2024',
      phoneNumber: '345-678-9012',
      source: 'Personal Visit',
      addedBy: 'Field Agent',
      branch: 'San Diego',
      address: '1010 Birch St, San Diego, CA 92101',
    ),
  ].obs;

  void deleteCustomer(Customer customer) {
    customers.remove(customer);
  }
  var filteredCustomers = <Customer>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredCustomers.value = customers;
  }

  void filterCustomers(String query) {
    if (query.isEmpty) {
      filteredCustomers.value = customers;
    } else {
      filteredCustomers.value = customers
          .where((customer) =>
          customer.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}