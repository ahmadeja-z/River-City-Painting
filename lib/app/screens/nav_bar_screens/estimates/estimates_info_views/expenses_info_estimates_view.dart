import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';
import 'package:painting/app/screens_model/controllers/nav_screens_controller/estimates_controllers/expenses_controller_info_estimates.dart';

class ExpensesInfoEstimatesView extends StatelessWidget {
  const ExpensesInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesController=Get.put(ExpensesControllerEstimates());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          CustomHeaderContainer(title: 'Expenses',onTap: (){
            expensesController.showExpenseDialog();
          },),
          // Add your content for the Expenses screen here
        ],
      ),
    );
  }
}
