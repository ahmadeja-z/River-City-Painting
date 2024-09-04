import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_nav_bar.dart';

import '../../resources/app_colors/app_colors.dart';
import '../../resources/assets/app_fonts.dart';
import '../../screens_model/controllers/nav_screens_controller/nav_bar_controller.dart';
import 'customers/customer_view.dart';
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
    CustomersView(),
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
        trailing: Obx(() {
          return pages.elementAt(navBarController.selectedIndex.value)==pages[0]?CircleAvatar(
            backgroundImage:AssetImage(AppImages.profileAvatar),
          ):SizedBox.shrink();
        },),
        leading: Obx(() {
          return pages.elementAt(navBarController.selectedIndex.value)==pages[0]?GestureDetector(onTap: (){},
            child: Icon(Icons.add),):SizedBox.shrink();
        },
        
        )
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
