import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_info_field.dart';

import '../../../../resources/app_colors/app_colors.dart';
import '../../../../resources/assets/app_fonts.dart';

class PaymentControllerEstimates extends GetxController{
  Rx<TextEditingController> invoiceController=TextEditingController().obs;
  Rx<TextEditingController> dateController=TextEditingController().obs;
  Rx<TextEditingController> amountController=TextEditingController().obs;
  Rx<TextEditingController> noteController=TextEditingController().obs;
  void showPaymentDialog(){
  TextStyle fontStyle=  TextStyle(fontFamily: AppFonts.poppinsRegular, fontSize: 12);

    Get.dialog(AlertDialog(
     title: Text('Payment',
         style: TextStyle(
             fontFamily: AppFonts.poppinsRegular,
             color: AppColors.primaryRed,
             fontWeight: FontWeight.bold)),
     content: SingleChildScrollView(
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Invoice',style: fontStyle,),
           CustomInfoTextField(hintText: 'Invoice', controller: invoiceController.value),
           Divider(
             
           )


         ],
       ),
     ),

   ));
  }
}