import 'package:flutter/material.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';


class CustomInfoTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String>? dropDownItems;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final TextInputType? keyBoardType;

  const CustomInfoTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.dropDownItems,
    this.currentFocus,
    this.nextFocus,  this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 390,
      child: Card(
        elevation: 3,
        child: TextField(

          keyboardType: keyBoardType,
          controller: controller,
          focusNode: currentFocus,
          onSubmitted: (value) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          readOnly: dropDownItems != null &&
              dropDownItems!.isNotEmpty, // Make it readonly if dropdown is present
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
                      style: const TextStyle(
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
                borderRadius: BorderRadius.circular(15),
                style: const TextStyle(
                    fontFamily: AppFonts.poppinsRegular, fontSize: 15),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20),
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
            hintStyle: const TextStyle(
                fontFamily: AppFonts.poppinsRegular,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            contentPadding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
