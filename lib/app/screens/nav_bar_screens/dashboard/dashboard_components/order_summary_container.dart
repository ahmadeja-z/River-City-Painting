import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

import '../../../../controllers/nav_screens_controller/dashboard_controller.dart';

class OrderSummaryContainer extends StatefulWidget {
  const OrderSummaryContainer({super.key});

  @override
  State<OrderSummaryContainer> createState() => _OrderSummaryContainerState();
}

class _OrderSummaryContainerState extends State<OrderSummaryContainer> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      dashboardController.changeTabIndex(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.width * 0.04), // Responsive padding
      height: Get.height * 0.4,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Orders Summary',
                style: TextStyle(
                  fontFamily: AppFonts.robotoRegular,
                  fontSize: Get.width * 0.043, // Responsive font size
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: Get.width * 0.04),
              TabBar(
                labelStyle: TextStyle(
                  fontSize: Get.width * 0.028, // Responsive tab text size
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.robotoRegular,
                ),
                controller: _tabController,
                dividerHeight: 0,
                labelPadding: EdgeInsets.only(right: Get.width * 0.02, left: Get.width * 0.02),
                tabAlignment: TabAlignment.start,
                labelColor: AppColors.primaryRed,
                unselectedLabelColor: Colors.black54,
                indicatorColor: AppColors.primaryRed,
                indicatorWeight: 3.0,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Monthly'),
                  Tab(text: 'Weekly'),
                  Tab(text: 'Today'),
                ],
              ),
            ],
          ),
          const Divider(height: 1),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Lorem ipsum dolor sit amet, consectetur',
            style: TextStyle(
              fontSize: Get.width * 0.032, // Responsive font size
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2A2B43),
              fontFamily: AppFonts.robotoRegular,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Expanded(
            child: Obx(() {
              return TabBarView(
                controller: _tabController,
                children: [
                  _buildOrderSummaryContent(
                    dashboardController.monthlyPercent.value,
                    dashboardController.monthlyAmount.value,
                    dashboardController.monthlySubText.value,
                    dashboardController.monthlyApproved.value,
                    dashboardController.monthlyPending.value,
                    dashboardController.monthlyCanceled.value,
                        () {},
                  ),
                  _buildOrderSummaryContent(
                    dashboardController.weeklyPercent.value,
                    dashboardController.weeklyAmount.value,
                    dashboardController.weeklySubText.value,
                    dashboardController.weeklyApproved.value,
                    dashboardController.weeklyPending.value,
                    dashboardController.weeklyCanceled.value,
                        () {},
                  ),
                  _buildOrderSummaryContent(
                    dashboardController.todayPercent.value,
                    dashboardController.todayAmount.value,
                    dashboardController.todaySubText.value,
                    dashboardController.todayApproved.value,
                    dashboardController.todayPending.value,
                    dashboardController.todayCanceled.value,
                        () {},
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryContent(
      double percent,
      double amount,
      double subText,
      int approved,
      int pending,
      int cancel,
      VoidCallback seeMoreAction,
      ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularPercentIndicator(
              radius: Get.width * 0.15, // Responsive size for circular indicator
              lineWidth: Get.width * 0.04, // Responsive line width
              percent: percent,
              animation: true,
              animationDuration: 1200,
              center: Text(
                "${(percent * 100).toStringAsFixed(0)}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.05,
                  color: Colors.black,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.grey.shade300,
              progressColor: AppColors.primaryRed,
              startAngle: 180.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$$amount',
                  style: TextStyle(
                    fontSize: Get.width * 0.048, // Responsive text size
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.robotoRegular,
                  ),
                ),
                Text(
                  'from \$$subText',
                  style: TextStyle(
                    fontSize: Get.width * 0.03,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.robotoRegular,
                  ),
                ),
                SizedBox(height: Get.height * 0.007),
                Text(
                  'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed do',
                  style: TextStyle(
                    fontFamily: AppFonts.robotoRegular,
                    fontSize: Get.width * 0.024,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.01),
                _buttonContainer('See More', seeMoreAction),
              ],
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoTile(approved, 'Approved'),
            _infoTile(pending, 'Pending'),
            _infoTile(cancel, 'Canceled'),
          ],
        ),
      ],
    );
  }

  Widget _buttonContainer(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: Get.width * 0.03,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoTile(int value, String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.6),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                fontFamily: AppFonts.robotoRegular,
                fontWeight: FontWeight.w700,
                fontSize: Get.width * 0.043,
              ),
            ),
            Text(
              status,
              style: TextStyle(
                fontFamily: AppFonts.robotoRegular,
                fontWeight: FontWeight.w400,
                fontSize: Get.width * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
