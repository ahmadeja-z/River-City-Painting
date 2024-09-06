import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

class BudgetInfoEstimatesView extends StatelessWidget {
  const BudgetInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          const CustomHeaderContainer(
            title: 'Budget',
            editAble: true,
          ),
          SizedBox(height: Get.height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                _buildInfoRow('Labor', '0.00'),
                const Divider(),
                _buildInfoRow('Material', '\$0.00'),
                _buildInfoRow('Expenses', '\$0.00'),
                _buildInfoRow('Profit', '\$0.00'),
                _buildInfoRow('Margin', '0.00'),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Estimated',
                    style: TextStyle(
                      fontFamily: AppFonts.poppinsRegular,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.poppinsRegular,
            fontSize: 12,
            color: Colors.grey.shade800,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.poppinsRegular,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

}
