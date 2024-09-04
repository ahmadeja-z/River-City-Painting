import 'package:get/get.dart';

class SchedulesController extends GetxController{
  var names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'David Brown','John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'David Brown'
  ].obs;

  var addresses = [
    '123 Main St, Springfield',
    '456 Elm St, Riverside',
    '789 Oak St, Lincoln',
    '101 Maple St, Kingston',
    '202 Pine St, Hamilton',  '123 Main St, Springfield',
    '456 Elm St, Riverside',
    '789 Oak St, Lincoln',
    '101 Maple St, Kingston',
    '202 Pine St, Hamilton'
  ].obs;

  var dates = [
    '12 August, 2024',
    '5 September, 2024',
    '15 October, 2024',
    '20 November, 2024',
    '1 December, 2024','12 August, 2024',
    '5 September, 2024',
    '15 October, 2024',
    '20 November, 2024',
    '1 December, 2024'
  ].obs;

  var schedulers = [
    'Scheduler A',
    'Scheduler B',
    'Scheduler C',
    'Scheduler D',
    'Scheduler E',  'Scheduler A',
    'Scheduler B',
    'Scheduler C',
    'Scheduler D',
    'Scheduler E'
  ].obs;

  var schedulerIds = [
    'ID12345',
    'ID23456',
    'ID34567',
    'ID45678',
    'ID56789', 'ID12345',
    'ID23456',
    'ID34567',
    'ID45678',
    'ID56789'
  ].obs;

  // Filtered lists based on search query
  var filteredNames = <String>[].obs;
  var filteredAddresses = <String>[].obs;
  var filteredDates = <String>[].obs;
  var filteredSchedulers = <String>[].obs;
  var filteredSchedulerIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initially, filtered lists are the same as original lists
    filteredNames.assignAll(names);
    filteredAddresses.assignAll(addresses);
    filteredDates.assignAll(dates);
    filteredSchedulers.assignAll(schedulers);
    filteredSchedulerIds.assignAll(schedulerIds);
  }

  // Method to filter the schedules by name
  void filterSchedules(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all schedules
      filteredNames.assignAll(names);
      filteredAddresses.assignAll(addresses);
      filteredDates.assignAll(dates);
      filteredSchedulers.assignAll(schedulers);
      filteredSchedulerIds.assignAll(schedulerIds);
    } else {
      // Filter the lists based on the search query
      List<int> filteredIndices = [];

      for (int i = 0; i < names.length; i++) {
        if (names[i].toLowerCase().contains(query.toLowerCase())) {
          filteredIndices.add(i);
        }
      }

      filteredNames.assignAll(filteredIndices.map((i) => names[i]).toList());
      filteredAddresses
          .assignAll(filteredIndices.map((i) => addresses[i]).toList());
      filteredDates.assignAll(filteredIndices.map((i) => dates[i]).toList());
      filteredSchedulers
          .assignAll(filteredIndices.map((i) => schedulers[i]).toList());
      filteredSchedulerIds
          .assignAll(filteredIndices.map((i) => schedulerIds[i]).toList());
    }
  }

}