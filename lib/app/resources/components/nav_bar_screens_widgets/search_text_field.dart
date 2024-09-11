import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onChanged;
  final String hintText;

  const SearchTextField({
    super.key,
    required this.textController,
    required this.onChanged,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: Get.width * 0.93,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1, 3))
          ]),
      child: TextField(
          controller: textController,
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: const Icon(
                Icons.mic_none_rounded,
                color: Colors.grey,
              ),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
                size: 20,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontFamily: AppFonts.montserratRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColors.primaryRed)))),
    );
  }
}
