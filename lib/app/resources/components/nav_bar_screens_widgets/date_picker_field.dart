import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app_colors/app_colors.dart';
import '../../assets/app_fonts.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;

  const DatePickerField({super.key, required this.controller});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      // Update the text field with the formatted date
      controller.text = formattedDate;
      // Optionally, you can set the cursor position to the end of the text
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: SizedBox(
          width: Get.width*0.33,
          height: Get.height*0.04,
          child: TextField(
            style: TextStyle(fontFamily: AppFonts.interRegular,fontSize: 10),
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              suffixIcon: Icon(CupertinoIcons.calendar,size: 20,),
              hintText: 'dd/mm/yyyy',
              hintStyle: const TextStyle(
                fontSize: 10,

                fontFamily: AppFonts.poppinsRegular,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xFFF7F8F8),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
