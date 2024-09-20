import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_todo_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/date_picker_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/assets/app_fonts.dart';

class PaymentControllerEstimates extends GetxController {
  Rx<TextEditingController> invoiceController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> amountController = TextEditingController().obs;
  Rx<TextEditingController> noteController = TextEditingController().obs;
  void showPaymentDialog() {
    TextStyle fontStyle =
        const TextStyle(fontFamily: AppFonts.poppinsRegular, fontSize: 12);

    Get.dialog(AlertDialog(
      title: const Text('Payment',
          style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              color: AppColors.primaryRed,
              fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Invoice',
              style: fontStyle,
            ),
            CustomToDoField(
                hintText: 'Invoice', controller: invoiceController.value),
            const Divider(),
            Text(
              'Details:',
              style: fontStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Date:',
                      style: fontStyle,
                    ),
                    SizedBox(
                        width: Get.width * 0.28,
                        child:
                            DatePickerField(controller: dateController.value))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Amount:',
                      style: fontStyle,
                    ),
                    SizedBox(
                        width: Get.width * 0.28,
                        child: CustomToDoField(
                            hintText: 'Amount',
                            controller: amountController.value))
                  ],
                )
              ],
            ),
            const Divider(),
            _buildTextSection('Note:', fontStyle),
            _buildNoteSection(fontStyle)
          ],
        ),
      ),
      actions: [
        CustomIconButton(
            title: 'cancel',
            onTap: () {
              Get.back();
            },
            color: Colors.transparent,
            textColor: AppColors.primaryRed),
        CustomIconButton(
            title: 'Save',
            onTap: () {},
            color: AppColors.primaryRed,
            textColor: AppColors.white)
      ],
    ));
  }

  Widget _buildNoteSection(TextStyle fontStyle) {
    return Container(

      width: Get.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyishBlack.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: fontStyle,
        controller: noteController.value,
        maxLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Note...',
          hintStyle: fontStyle,
        ),
      ),
    );
  }

  Widget _buildTextSection(String text, TextStyle fontStyle) {
    return Text(text, style: fontStyle);
  }
}
