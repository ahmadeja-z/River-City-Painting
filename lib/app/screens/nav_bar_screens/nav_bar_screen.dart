import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_nav_bar.dart';
import 'package:painting/app/screens/nav_bar_screens/customers/add_customers_screen.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/add_estimates.dart';
import '../../resources/app_colors/app_colors.dart';
import '../../resources/assets/app_fonts.dart';
import '../../screens_model/controllers/nav_screens_controller/nav_bar_controller.dart';
import 'customers/customer_view.dart';
import 'dashboard/dashboard_view.dart';
import 'estimates/estimates_view.dart';

class NavBarScreen extends StatefulWidget {
  NavBarScreen({super.key});
  static const List<String> titles = <String>[
    'Dashboard',
    'Customers',
    'Estimates',
    'Profile'
  ];
  static const List<Widget> pages = <Widget>[
    DashboardView(),
    CustomersView(),
    EstimatesView(),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final navBarController = Get.put(NavBarController());

  late CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = [
    TabItem(Icons.dashboard_outlined, "Home",Colors.white,
        labelStyle: TextStyle(color: Colors.white,fontFamily: AppFonts.poppinsRegular,fontSize: 12),

    ),
    TabItem(CupertinoIcons.person_2, "Customers", Colors.white,labelStyle: TextStyle(color: Colors.white,fontFamily: AppFonts.poppinsRegular,fontSize: 12),),
    TabItem(Icons.menu_rounded, "Estimates", Colors.white,labelStyle: TextStyle(color: Colors.white,fontFamily: AppFonts.poppinsRegular,fontSize: 12),),
    TabItem(CupertinoIcons.person, "Profile", Colors.white,labelStyle: TextStyle(color: Colors.white,fontFamily: AppFonts.poppinsRegular,fontSize: 12),),
  ];
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(
        navBarController.selectedIndex.value);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Obx(
            () => Text(
              NavBarScreen.titles[navBarController.selectedIndex.value],
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
              return NavBarScreen.pages
                          .elementAt(navBarController.selectedIndex.value) ==
                      NavBarScreen.pages[0]
                  ? const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileAvatar),
                    )
                  : NavBarScreen.pages.elementAt(
                              navBarController.selectedIndex.value) ==
                          NavBarScreen.pages[1]
                      ? IconButton(
                          onPressed: () {
                            Get.to(const AddCustomers());
                          },
                          icon: const Icon(
                            CupertinoIcons.add,
                            color: AppColors.primaryRed,
                          ))
                      : NavBarScreen.pages.elementAt(
                                  navBarController.selectedIndex.value) ==
                              NavBarScreen.pages[2]
                          ? IconButton(
                              onPressed: () {
                                Get.to(const AddEstimates());
                              },
                              icon: const Icon(
                                CupertinoIcons.add,
                                color: AppColors.primaryRed,
                              ))
                          : const SizedBox.shrink();
            },
          ),
          leading: Obx(
            () {
              return NavBarScreen.pages
                          .elementAt(navBarController.selectedIndex.value) ==
                      NavBarScreen.pages[0]
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: AppColors.primaryRed,
                      ))
                  : const SizedBox.shrink();
            },
          )),
      body: Obx(
        () => Stack(
          children: [
            NavBarScreen.pages.elementAt(navBarController.selectedIndex.value),
            Align(
              alignment: Alignment.bottomCenter,
              child: CircularBottomNavigation(
                backgroundBoxShadow: [BoxShadow(
                  color: Colors.transparent
                )],
                barBackgroundColor: AppColors.primaryRed,
                selectedIconColor: AppColors.primaryRed,
                normalIconColor: Colors.white,
                tabItems,
                iconsSize: 25,
                selectedPos: navBarController.selectedIndex.value,
                controller: _navigationController,
                selectedCallback: (int? selectedPos) {
                  navBarController.selectedIndex.value = selectedPos!;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
