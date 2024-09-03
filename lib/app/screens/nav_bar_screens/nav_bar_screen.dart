import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_nav_bar.dart';
import 'package:painting/app/screens_model/controllers/nav_screens/nav_bar_controller.dart';

import '../../resources/app_colors/app_colors.dart';
import '../../resources/assets/app_fonts.dart';
import 'dashboard/dashboard_view.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({super.key});
  final navBarController = Get.put(NavBarController());
  static const List<String> titles = <String>[
    'Dashboard',
    'Customers',
    'Estimates',
    'Profile'
  ];
  static const List<Widget> pages = <Widget>[
    DashboardView(),
    Center(child: Text('Customers', style: TextStyle(fontSize: 24))),
    Center(child: Text('Estimates', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Obx(
          () => Text(
            titles[navBarController.selectedIndex.value],
            style: const TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.poppinsRegular,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => pages.elementAt(navBarController.selectedIndex.value),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: NavBar(),
          )
        ],
      ),

    );
  }
}
