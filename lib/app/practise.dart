import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryController extends GetxController {
  var selectedTabIndex = 0.obs;
  var percentage = 85.obs;
  var totalAmount = 456005.56.obs;
  var targetAmount = 500000.00.obs;
  var approved = 25.obs;
  var pending = 60.obs;
  var canceled = 15.obs;

  void updateValues(int index) {
    selectedTabIndex.value = index;
    switch (index) {
      case 0: // Monthly
        percentage.value = 85;
        totalAmount.value = 456005.56;
        approved.value = 25;
        pending.value = 60;
        canceled.value = 15;
        break;
      case 1: // Weekly
        percentage.value = 60; // Example value
        totalAmount.value = 300000.00; // Example value
        approved.value = 15;
        pending.value = 20;
        canceled.value = 5;
        break;
      case 2: // Today
        percentage.value = 45; // Example value
        totalAmount.value = 100000.00; // Example value
        approved.value = 5;
        pending.value = 10;
        canceled.value = 2;
        break;
    }
  }

  @override
  void onClose() {
    // Cancel any ongoing operations or dispose resources if needed
    super.onClose();
  }
}

class OrderSummaryScreen extends StatefulWidget {
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      if (_tabController?.indexIsChanging == false) {
        Get.find<OrderSummaryController>()
            .updateValues(_tabController?.index ?? 0);
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OrderSummaryController controller = Get.put(OrderSummaryController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Summary"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Monthly"),
            Tab(text: "Weekly"),
            Tab(text: "Today"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Obx(() => buildSummary(controller)),
          Obx(() => buildSummary(controller)),
          Obx(() => buildSummary(controller)),
        ],
      ),
    );
  }

  Widget buildSummary(OrderSummaryController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Circular percentage indicator
        CircularProgressIndicator(
          value: controller.percentage.value / 100,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          strokeWidth: 10,
        ),
        SizedBox(height: 10),
        Text(
          "${controller.percentage.value}%",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10),
        Text(
          "\$${controller.totalAmount.value.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "from \$${controller.targetAmount.value.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text("See More"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[100],
            textStyle: TextStyle(color: Colors.red),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildStatusCard("Approved", controller.approved.value),
            buildStatusCard("Pending", controller.pending.value),
            buildStatusCard("Canceled", controller.canceled.value),
          ],
        ),
      ],
    );
  }

  Widget buildStatusCard(String title, int value) {
    return Column(
      children: [
        Text(
          "$value",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(title, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

void main() {

  runApp(GetMaterialApp(home: OrderSummaryScreen()));
}
