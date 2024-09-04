import 'package:flutter/material.dart';
import '../../app_colors/app_colors.dart';
import '../../assets/app_fonts.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    super.key,
    required this.customerName,
    required this.customerEmail,
    required this.onEditTap,
    required this.onDeleteTap, required this.onClick
  });

  final String customerName;
  final String customerEmail;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 75,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 2,
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  customerName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.poppinsRegular,
                  ),
                ),
                GestureDetector(
                  onTap: onEditTap,
                  child: const Icon(
                    Icons.mode_edit_outlined,
                    color: AppColors.primaryRed,
                    size: 23,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  customerEmail,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.poppinsRegular,
                  ),
                ),
                GestureDetector(
                  onTap: onDeleteTap,
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.primaryRed,
                    size: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
