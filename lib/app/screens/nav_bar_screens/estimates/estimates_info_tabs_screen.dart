import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_app_bar.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/owner_info_container.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/estimates_info_views/profitability_info_estimates_view.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/assets/app_fonts.dart';
import 'add_estimates.dart';
import 'estimates_info_views/action_info_estimates_view.dart';
import 'estimates_info_views/budget_info_estimates_view.dart';
import 'estimates_info_views/contacts_info_estimates_view.dart';

class EstimatesInfoTabScreen extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Project'),
    const Tab(text: 'Contacts'),
    const Tab(text: 'Actions'),
    const Tab(text: 'Profitability'),
    const Tab(text: 'Budget'),
  ];

  EstimatesInfoTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: CustomAppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.primaryRed,
                )),
            title: const Text(
              'Estimates',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.poppinsRegular,
                  fontSize: 20,
                  color: AppColors.primaryRed),
            ),
        trailing: IconButton(
            onPressed: () {
              Get.to(const AddEstimates());
            },
            icon: const Icon(
              CupertinoIcons.add,
              color: AppColors.primaryRed,
            )),),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),

            OwnerInfoContainer(
                name: 'Tami Levin',
                number: '0123456789',
                email: 'tami.levin@gmail.com',
                infoTap: () {},
                projectOwner: 'Coby Developer'),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TabBar(
              labelStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.poppinsRegular,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              tabs: myTabs,
              tabAlignment: TabAlignment.start,
              labelColor: AppColors.primaryRed,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryRed,
              isScrollable: true,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Project Content')),
                  ContactsInfoEstimatesView(),
                  ActionsEstimatesInfo(),
                  ProfitabilityInfoEstimatesView(),
                  BudgetInfoEstimatesView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
