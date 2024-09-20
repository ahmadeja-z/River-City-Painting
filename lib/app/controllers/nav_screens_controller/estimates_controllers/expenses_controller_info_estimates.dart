import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/custom_todo_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/date_picker_field.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/icon_button.dart';

import '../../../resources/assets/app_fonts.dart';

class ExpensesControllerEstimates extends GetxController {
  final dateController = TextEditingController().obs;
  final vendorController = TextEditingController().obs;
  final subTotalController = TextEditingController().obs;
  final totalController = TextEditingController().obs;
  final itemTypeController = TextEditingController().obs;
  final hoursController = TextEditingController().obs;
  final taxController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  RxBool isPaid = false.obs;

  void showExpenseDialog() {
    TextStyle fontStyle =
        TextStyle(fontFamily: AppFonts.poppinsRegular, fontSize: 12);
    Get.dialog(AlertDialog(
      title: Text(
        'Add Expenses',
        style:
            TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            _customRow(
                _customColumn(
                    Text(
                      'Date:',
                      style: fontStyle,
                    ),
                    DatePickerField(controller: dateController.value)),
                _customColumn(
                    Text(
                      'Item Type',
                      style: fontStyle,
                    ),
                    CustomToDoField(
                      hintText: 'Material',
                      controller: itemTypeController.value,
                      dropDownItems: ['Hard', 'Not hard', 'Havey'],
                    ))),
            _customRow(
                _customColumn(
                    Text(
                      'Vendor:',
                      style: fontStyle,
                    ),
                    CustomToDoField(
                      controller: vendorController.value,
                      hintText: 'Vendor',
                    )),
                _customColumn(
                    Text(
                      'Hours:',
                      style: fontStyle,
                    ),
                    CustomToDoField(
                        hintText: 'Hours',
                        keyBoardType: TextInputType.number,
                        controller: hoursController.value))),
            _customRow(
              _customColumn(
                  Text(
                    'Subtotal:',
                    style: fontStyle,
                  ),
                  CustomToDoField(
                    hintText: 'Subtotal',
                    controller: subTotalController.value,
                    keyBoardType: TextInputType.number,
                  )),
              _customColumn(
                  Text(
                    'Tax:',
                    style: fontStyle,
                  ),
                  CustomToDoField(
                    hintText: 'Tax',
                    controller: taxController.value,
                    keyBoardType: TextInputType.number,
                  )),
            ),

                Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _customColumn(
                        Text(
                          'Total:',
                          style: fontStyle,
                        ),
                        CustomToDoField(
                          hintText: 'Total',
                          controller: totalController.value,
                          keyBoardType: TextInputType.number,
                        )
                                   ),
                   SizedBox(width: Get.width*0.06,),
                   Obx(() =>  Row(children: [
                     Checkbox(
                       value: isPaid.value,
                       onChanged: (value) {
                         isPaid.value = !isPaid.value;
                       },
                     ),
                     Text('Paid',style: fontStyle,)
                   ],),)
                  ],
                ),
            SizedBox(
              height: Get.height * 0.03,
            ),

                Text(
                  'Description',
                  style: fontStyle,
                ),
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
            color: AppColors.noColor,
            textColor: AppColors.primaryRed),
        CustomIconButton(
            title: 'Save',
            onTap: () {},
            color: AppColors.primaryRed,
            textColor: AppColors.white)
      ],
    ));
  }

  Widget _customRow(Widget first, Widget second) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [first, second],
    );
  }

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
        controller: descriptionController.value,
        style: fontStyle,
        maxLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Description...',
          hintStyle: fontStyle,
        ),
      ),
    );
  }

  Widget _customColumn(Widget first, Widget second) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [first, SizedBox(
      width:     Get.width*0.27,
          child: second)],
    );
  }
}
