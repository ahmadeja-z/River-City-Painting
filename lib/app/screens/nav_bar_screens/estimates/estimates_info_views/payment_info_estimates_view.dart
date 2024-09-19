import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

import '../../../../controllers/nav_screens_controller/estimates_controllers/payment_controller_info_estimates.dart';

class PaymentInfoEstimatesView extends StatelessWidget {
  const PaymentInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController=Get.put(PaymentControllerEstimates());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          CustomHeaderContainer(title: 'Payment',
          onTap: (){paymentController.showPaymentDialog();},),
          // Add your content for the Payment screen here
        ],
      ),
    );
  }
}
