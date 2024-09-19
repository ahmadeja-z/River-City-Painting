import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/controllers/nav_screens_controller/estimates_controllers/email_controller_info_estimates.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

class EmailsInfoEstimatesView extends StatelessWidget {
  const EmailsInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController=Get.put(EmailControllerEstimates());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          CustomHeaderContainer(title: 'Emails',
          onTap: emailController.showEmailDialog,),
          // Add your content for the Emails screen here
        ],
      ),
    );
  }
}
