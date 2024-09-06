import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_icons.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/estimates_info_tabs_screen.dart';

class EstimatesProfileContainer extends StatelessWidget {
  const EstimatesProfileContainer(
      {super.key,

      required this.name,
      required this.date,
      required this.number,
      required this.type,
      required this.crewLeader,
      required this.address,
      required this.branchName,
      required this.scheduler,
      this.onOption,
      this.status, required this.onTileTap});
  final VoidCallback onTileTap;
  final String name;
  final String date;
  final String number;
  final String type;
  final String crewLeader;
  final String address;
  final String branchName;
  final String scheduler;
  final String? status;
  final VoidCallback? onOption;
  @override
  Widget build(BuildContext context) {
    TextStyle infoStyle = const TextStyle(
        fontFamily: AppFonts.poppinsRegular,
        fontWeight: FontWeight.w500,
        fontSize: 10);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTileTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 150,
          width: 390,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 3),
                    spreadRadius: 3,
                    blurRadius: 3)
              ],
              color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFonts.poppinsRegular),
                          ),
                          Text(
                            date,
                            style: infoStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            number,
                            style: infoStyle,
                          ),
                          Text(
                            branchName,
                            style: infoStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type,
                            style: infoStyle,
                          ),
                          Text(
                            scheduler,
                            style: infoStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            crewLeader,
                            style: infoStyle,
                          ),
                          Container(
                            height: 17,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.pending,
                                  size: 7,
                                ),
                                Text(
                                  ' $status',
                                  style: const TextStyle(
                                      fontFamily: AppFonts.poppinsRegular,
                                      fontSize: 9),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Text(
                        address,
                        style: infoStyle,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: onOption,
                    child: Image.asset(
                      AppIcons.menuDot,
                      scale: 2,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
