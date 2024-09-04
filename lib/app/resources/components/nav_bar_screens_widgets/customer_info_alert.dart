import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class CustomerDetailsDialog extends StatelessWidget {
  final String customerName;
  final String customerEmail;
  final String date;
  final String phoneNumber;
  final String source;
  final String addedBy;
  final String branch;
  final String address;

  const CustomerDetailsDialog({
    Key? key,
    required this.customerName,
    required this.customerEmail,
    required this.date,
    required this.phoneNumber,
    required this.source,
    required this.addedBy,
    required this.branch,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Align(
                 alignment: Alignment.center,
                 child: Text('Details',style: TextStyle(fontFamily:AppFonts.poppinsRegular,fontWeight: FontWeight.w600,fontSize: 18 ),)),

            Divider(),
            SizedBox(width: Get.width*1,),
            _buildDetailRow('Name', customerName),
            _buildDetailRow('Email:', customerEmail),
            _buildDetailRow('Date:', date),
            _buildDetailRow('Phone Number:', phoneNumber),
            _buildDetailRow('Source:', source),
            _buildDetailRow('Added By:', addedBy),
            _buildDetailRow('Branch:', branch),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.poppinsRegular,
                    fontSize: 12,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110),
                  child: Text(
                    address,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.poppinsRegular
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.poppinsRegular
            ),
          ),
        ],
      ),
    );
  }
}
