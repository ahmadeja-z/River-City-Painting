import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

class InvoicesInfoEstimatesView extends StatelessWidget {
  const InvoicesInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          CustomHeaderContainer(title: 'Invoices'),
          // Add your content for the Invoices screen here
        ],
      ),
    );
  }
}
