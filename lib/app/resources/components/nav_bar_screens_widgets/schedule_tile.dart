import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class ScheduleTile extends StatelessWidget {
  const ScheduleTile(
      {super.key,
      required this.title,
      required this.address,
      required this.schedule,
      required this.scheduleId,
      required this.date});
  final String title;
  final String address;
  final String schedule;
  final String scheduleId;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: Get.height * 0.121,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 3),
                  blurRadius: 7,
                  spreadRadius: 4),
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
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppinsRegular,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppinsRegular,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.007,
            ),
            Text(
              address,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: AppFonts.poppinsRegular),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  schedule,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.poppinsRegular),
                ),
                Text(
                  scheduleId.toString(),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.poppinsRegular),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
