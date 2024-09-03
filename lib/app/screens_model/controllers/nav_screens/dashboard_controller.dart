import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  RxInt totalCustomer = 5732.obs;
  RxInt totalStuff = 5732.obs;
  RxInt totalOrders = 5732.obs;
  RxInt totalRevenue = 5732.obs;
  var selectedTabIndex = 0.obs;

  // Percent values
  var monthlyPercent = 0.85.obs;
  var weeklyPercent = 0.75.obs;
  var todayPercent = 0.60.obs;

  // Amount values
  var monthlyAmount = 456005.56.obs;
  var weeklyAmount = 350000.00.obs;
  var todayAmount = 250000.00.obs;

  // Subtext values
  var monthlySubText = 500000.00.obs;
  var weeklySubText = 400000.00.obs;
  var todaySubText = 300000.00.obs;

  // Order status counts
  var monthlyApproved = 25.obs;
  var weeklyApproved = 44.obs;
  var todayApproved = 45.obs;

  var monthlyPending = 60.obs;
  var weeklyPending = 22.obs;
  var todayPending = 66.obs;

  var monthlyCanceled = 15.obs;
  var weeklyCanceled = 66.obs;
  var todayCanceled = 32.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  var pendingOrders = 1220.obs;
  var completeOrders = 2330.obs;
  var cancelOrders = 2220.obs;
  var monthYear = '${DateTime.now().month}/${DateTime.now().year}'.obs;

  double get pendingPercent =>
      totalOrders.value > 0 ? pendingOrders.value / totalOrders.value : 0.0;
  double get completePercent =>
      totalOrders.value > 0 ? completeOrders.value / totalOrders.value : 0.0;
  double get cancelPercent =>
      totalOrders.value > 0 ? cancelOrders.value / totalOrders.value : 0.0;

  void updateOrders({
    required int total,
    required int pending,
    required int complete,
    required int cancel,
  }) {
    totalOrders.value = total;
    pendingOrders.value = pending;
    completeOrders.value = complete;
    cancelOrders.value = cancel;
  }

  void setMonthYear(DateTime date) {
    monthYear.value = DateFormat('MMMM, yyyy').format(date);
  }

  var toDoList = <ToDoModel>[].obs;
  final toDoController = TextEditingController().obs;
  RxBool isDone = false.obs;

  void addToDo(String title) {
    toDoList.add(ToDoModel(title: title));
  }

  void upDateTodoStatus(int index, bool isDone) {
    toDoList[index].isDone = isDone;
    toDoList.refresh();
  }

  void deleteToDoAt(int index) {
    toDoList.removeAt(index);
  }
}

class ToDoModel {
  String? title;
  bool isDone;

  ToDoModel({this.title, this.isDone = false});
}
