import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_icons.dart';

import '../../../screens_model/controllers/nav_screens_controller/nav_bar_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final List<Image> navIcons = [
    Image.asset(AppIcons.tabIcon1, scale: 2),
    Image.asset(AppIcons.tabIcon2, scale: 2),
    Image.asset(AppIcons.tabIcon3, scale: 2),
    Image.asset(AppIcons.tabIcon4, scale: 2),
  ];

  final List<Image> navSelectedIcons = [
    Image.asset(AppIcons.tabIcon1, scale: 2, color: AppColors.primaryRed),
    Image.asset(AppIcons.tabIcon2, scale: 2, color: AppColors.primaryRed),
    Image.asset(AppIcons.tabIcon3, scale: 2, color: AppColors.primaryRed),
    Image.asset(AppIcons.tabIcon4, scale: 2, color: AppColors.primaryRed),
  ];

  final List<String> navTitle = ['Dashboard', 'Customers', 'Estimates', 'Profile'];

  final _navController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 108, // Adjust height to accommodate the selected icon's elevation
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: AppColors.primaryRed,
              ),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(navIcons.length, (index) {
                    bool isSelected = _navController.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        _navController.changeIndex(index);
                      },
                      child: isSelected
                          ? Container(width: 65)
                          : AnimatedSwitcher(
                        duration: const Duration(),
                        child: navIcons[index],
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
          Obx(() {
            int selectedIndex = _navController.selectedIndex.value;
            return Positioned.fill(
              top: 0, // Adjusts the selected icon's position
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(navIcons.length, (index) {
                  if (index == selectedIndex) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryRed, width: 5),
                          ),
                          child: Center(
                            child: navSelectedIcons[selectedIndex],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          navTitle[selectedIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.poppinsRegular,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(width: 0,); // Empty space for unselected items
                  }
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}
