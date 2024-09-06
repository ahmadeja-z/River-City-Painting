import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_nav_bar.dart';
import 'package:painting/app/screens/nav_bar_screens/customers/add_customers_view.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/add_estimates.dart';
import '../../resources/app_colors/app_colors.dart';
import '../../resources/assets/app_fonts.dart';
import '../../screens_model/controllers/nav_screens_controller/nav_bar_controller.dart';
import 'customers/customer_view.dart';
import 'dashboard/dashboard_view.dart';
import 'estimates/estimates_view.dart';

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
    EstimatesView(),    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
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
          trailing: Obx(
            () {
              return pages.elementAt(navBarController.selectedIndex.value) ==
                      pages[0]
                  ? const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileAvatar),
                    )
                  : pages.elementAt(navBarController.selectedIndex.value) ==
                          pages[1]
                      ? IconButton(
                          onPressed: () {
                            Get.to(const AddCustomersView());
                          },
                          icon: const Icon(
                            CupertinoIcons.add,
                            color: AppColors.primaryRed,
                          ))
                      :pages.elementAt(navBarController.selectedIndex.value)==pages[2]?
              IconButton(
                  onPressed: () {
                    Get.to(const AddEstimates());
                  },
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: AppColors.primaryRed,
                  )):
              const SizedBox.shrink();
            },
          ),
          leading: Obx(
            () {
              return pages.elementAt(navBarController.selectedIndex.value) ==
                      pages[0]
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: AppColors.primaryRed,
                      ))
                  : const SizedBox.shrink();
            },
          )),
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
