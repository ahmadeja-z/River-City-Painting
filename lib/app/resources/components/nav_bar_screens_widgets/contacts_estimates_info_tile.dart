import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

import '../../assets/app_icons.dart';

class ContactsTileEstimatesInfo extends StatelessWidget {
  const ContactsTileEstimatesInfo({
    super.key,
    required this.title,
    required this.name,
    required this.email,
    required this.number,
    this.onEditClick,
    this.onDeleteClick,
  });
  final String title;
  final String name;
  final String email;
  final String number;
  final VoidCallback? onEditClick;
  final VoidCallback? onDeleteClick;

  @override
  Widget build(BuildContext context) {
    TextStyle infoStyle = TextStyle(
        fontSize: 10,
        fontFamily: AppFonts.poppinsRegular,
        fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: Get.height * 0.115,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 3),
                  blurRadius: 2,
                  spreadRadius: 2),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: infoStyle,
                ),
                Text(
                  name,
                  style: infoStyle,
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.007,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  email,
                  style: infoStyle),
                Text(
                  number,
                  style:  infoStyle,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Actions',
                  style: infoStyle,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: onEditClick,
                        child: Image.asset(
                          AppIcons.editIcon,
                          color: Colors.blueAccent,
                          scale: 2.3,
                        )),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    GestureDetector(
                        onTap: onDeleteClick,
                        child: const Icon(
                          CupertinoIcons.delete_solid,
                          color: Colors.red,
                          size: 15,
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
