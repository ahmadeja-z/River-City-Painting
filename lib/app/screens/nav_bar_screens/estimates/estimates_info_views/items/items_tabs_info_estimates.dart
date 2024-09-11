import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import '../../../../../resources/app_colors/app_colors.dart';
import '../../../../../resources/components/nav_bar_screens_widgets/estimates_header_container.dart';
import '../../../../../screens_model/controllers/nav_screens_controller/estimates_controllers/items_controller_info_estimates.dart';

class ItemsTabsInfoEstimates extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Additional Items'),
    const Tab(text: 'Labor'),
    const Tab(text: 'Material'),
  ];

  ItemsTabsInfoEstimates({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemsControllerEstimates());

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomHeaderContainer(
              onTap: () {
                itemController.showDropdownMenu(context);
              },
              title: 'Items',
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TabBar(
              labelStyle: const TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.poppinsRegular,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              tabs: myTabs,
              labelColor: AppColors.primaryRed,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryRed,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              labelPadding: const EdgeInsets.symmetric(horizontal: 1),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Additional Items')),
                  Center(child: Text('Labor')),
                  Center(child: Text('Material')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
