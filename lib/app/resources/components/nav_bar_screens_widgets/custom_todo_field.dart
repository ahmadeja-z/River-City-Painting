import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class CustomToDoField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String>? dropDownItems;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final TextInputType? keyBoardType;

  const CustomToDoField({
    super.key,
    required this.hintText,
    required this.controller,
    this.dropDownItems,
    this.currentFocus,
    this.nextFocus,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.04, // Adjust height responsively
      width: Get.width * 0.9,   // Adjust width responsively
      child: TextField(

        style: TextStyle(
          fontFamily: AppFonts.poppinsRegular,
          fontSize: 12,
        ),
        keyboardType: keyBoardType,
        controller: controller,
        focusNode: currentFocus,
        onSubmitted: (value) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        readOnly: dropDownItems != null && dropDownItems!.isNotEmpty, // Make it readonly if dropdown is present
        decoration: InputDecoration(
          suffixIcon: dropDownItems != null && dropDownItems!.isNotEmpty
              ? DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: dropDownItems!
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppFonts.poppinsRegular,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  controller.text = newValue; // Set the text in the TextEditingController
                }
              },
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontFamily: AppFonts.poppinsRegular,
                fontSize: 13,
                color: Colors.black,
              ),
              icon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
              elevation: 6,
              dropdownColor: Colors.white,
            ),
          )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontSize: 15,
            color: Colors.grey[600],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
        ),
      ),
    );
  }
}
