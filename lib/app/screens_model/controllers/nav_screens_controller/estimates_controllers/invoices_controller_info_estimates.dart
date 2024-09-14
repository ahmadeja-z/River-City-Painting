import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/app_colors/app_colors.dart';
import '../../../../resources/assets/app_fonts.dart';
import '../../../../resources/components/nav_bar_screens_widgets/custom_todo_field.dart';
import '../../../../resources/components/nav_bar_screens_widgets/date_picker_field.dart';
import '../../../../resources/components/nav_bar_screens_widgets/icon_button.dart';

class InvoiceControllerEstimates extends GetxController {
  // Reactive variables for UI state
  var subtotal = 0.0.obs,
      remainingValue = 0.0.obs,
      persentTotalValue = 0.0.obs,
      fixedTotalValue = 0.0.obs,
      tax = 0.0.obs,
      total = 0.0.obs;

  var dateController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var persentController = TextEditingController().obs;
  var fixedController = TextEditingController().obs;
  var subTotalController = TextEditingController().obs;
  var taxController = TextEditingController().obs;
  var totalController = TextEditingController().obs;
  var noteController = TextEditingController().obs;

  // Reactive variable to manage selected radio option
  var selectedOption = 'remaining'.obs;

  void showInvoiceDialog() {
    TextStyle fontStyle =
    TextStyle(fontFamily: AppFonts.poppinsRegular, fontSize: 12);

    Get.dialog(AlertDialog(
      title: Text('Invoice',
          style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              color: AppColors.primaryRed,
              fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextSection('Details:', fontStyle),
            SizedBox(height: Get.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildColumn(
                    'Date:',
                    DatePickerField(controller: dateController.value),
                    fontStyle),
                _buildColumn(
                    'Name:',
                    CustomToDoField(
                        hintText: 'Name', controller: nameController.value),
                    fontStyle),
              ],
            ),
            Divider(),
            _buildTextSection('Amount:', fontStyle),
            Obx(() => _buildAmountSection(fontStyle),),
            SizedBox(height: Get.height * 0.02),
            _buildTotalSection(fontStyle),
            _buildTextSection('Note', fontStyle),
            _buildNoteSection(fontStyle),
          ],
        ),
      ),
      actions: [
        CustomIconButton(
            title: 'cancel',
            onTap: () {Get.back();},
            color: Colors.transparent,
            textColor: AppColors.black),
        CustomIconButton(
            title: 'Save',
            onTap: () {Get.back();},
            color: AppColors.primaryRed,
            textColor: AppColors.white),
      ],
    ));
  }

  // Build reusable column
  Widget _buildColumn(String label, Widget child, TextStyle fontStyle) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: fontStyle),
      SizedBox(width: Get.width * 0.3, child: child)
    ]);
  }

  // Build text sections
  Widget _buildTextSection(String text, TextStyle fontStyle) {
    return Text(text, style: fontStyle);
  }

  // Build amount section
  Widget _buildAmountSection(TextStyle fontStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRadioOption(
            'Remaining (\$$remainingValue)', 'remaining', fontStyle),
        _buildRadioOption(
            '% of Total (\$$persentTotalValue)', 'persentTotal', fontStyle),
        _buildRadioOption(
            'Fixed Total (\$$fixedTotalValue)', 'fixedTotal', fontStyle),
        _buildRadioOption('Custom Amount', 'customAmount', fontStyle),
        _buildPercentFixedSection(fontStyle),
        Divider()
      ],
    );
  }

  // Build total section with subtotal, tax, and total
  Widget _buildTotalSection(TextStyle fontStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildColumn(
                'Subtotal(\$):',
                CustomToDoField(
                    keyBoardType: TextInputType.number,
                    hintText: '0.00',
                    controller: subTotalController.value),
                fontStyle),
            _buildColumn(
                'Tax(\$):',
                CustomToDoField(
                    keyBoardType: TextInputType.number,
                    hintText: '0.00',
                    controller: taxController.value),
                fontStyle),
          ],
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        _buildColumn(
            'Total(\$):',
            CustomToDoField(
                keyBoardType: TextInputType.number,
                hintText: '0.00',
                controller: totalController.value),
            fontStyle),
      ],
    );
  }

  // Build note section
  Widget _buildNoteSection(TextStyle fontStyle) {
    return Container(
      height: Get.height * 0.07,
      width: Get.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyishBlack.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: fontStyle,
        maxLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Note...',
          hintStyle: fontStyle,
        ),
      ),
    );
  }

  // Build radio option rows
  Widget _buildRadioOption(
      String label, String value, TextStyle fontStyle) {
    return Row(
      children: [
        Obx(() => Radio<String>(
            activeColor: AppColors.blue,
            value: value,
            groupValue: selectedOption.value,
            onChanged: (newValue) => selectedOption.value = newValue ?? '')),
        Text(label, style: fontStyle),
      ],
    );
  }

  // Build percent and fixed amount fields
  Widget _buildPercentFixedSection(TextStyle fontStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColumn(
            'Percent(%):',
            CustomToDoField(
                keyBoardType: TextInputType.number,
                hintText: 'Percent',
                controller: persentController.value),
            fontStyle),
        _buildColumn(
            'Fixed(\$):',
            CustomToDoField(
                keyBoardType: TextInputType.number,
                hintText: 'Fixed',
                controller: fixedController.value),
            fontStyle),
      ],
    );
  }
}
