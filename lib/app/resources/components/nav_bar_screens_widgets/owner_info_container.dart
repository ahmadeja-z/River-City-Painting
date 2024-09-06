import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class OwnerInfoContainer extends StatelessWidget {
  const OwnerInfoContainer(
      {super.key,
        required this.name,
        required this.number,
        required this.email,
        required this.infoTap,
        required this.projectOwner});
  final String name;
  final String projectOwner;
  final String number;
  final String email;
  final VoidCallback infoTap;

  @override
  Widget build(BuildContext context) {
    TextStyle infoStyle = const TextStyle(
        fontFamily: AppFonts.poppinsRegular,
        fontWeight: FontWeight.w500,
        fontSize: 10);
    return Container(
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.1,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(1, 3))
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            'Project Owner:$projectOwner',
            style: const TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.poppinsRegular,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: infoStyle,
              ),
              Text(
                email,
                style: infoStyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: infoStyle,
              ),
              Row(
                children: [
                  Text(
                    'View More',
                    style: infoStyle,
                  ),
                  GestureDetector(
                      onTap: infoTap,
                      child: const Icon(Icons.arrow_drop_down))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
