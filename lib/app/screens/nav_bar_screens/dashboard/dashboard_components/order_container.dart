import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/app_colors/app_colors.dart';
import '../../../../resources/assets/app_fonts.dart';
import '../../../../controllers/nav_screens_controller/dashboard_controller.dart';

class OrdersWidget extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

   OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: Get.width*0.15,top: Get.width*0.05,right: Get.width*0.03,left: Get.width*0.03),

      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: AppFonts.poppinsRegular,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() => GestureDetector(
                onTap: () async {
                  DateTime now = DateTime.now();
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: DateTime(now.year - 10),
                    lastDate: DateTime(now.year + 10),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors.red,
                          hintColor: Colors.red,
                          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (selectedDate != null && selectedDate != now) {
                    controller.setMonthYear(selectedDate);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      controller.monthYear.value,
                      style: const TextStyle(
                        fontFamily: AppFonts.poppinsRegular,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: Get.width * 0.01),
                    const Icon(
                      CupertinoIcons.arrow_down_square,
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => CustomPaint(
                  size: const Size(164, 164), // Set the size of the circular indicator
                  painter: _MultiSegmentCircularPainter(
                    pendingPercent: controller.pendingPercent,
                    completePercent: controller.completePercent,
                    cancelPercent: controller.cancelPercent,
                  ),
                  child: Center(
                    child: Text(
                      '${(controller.completePercent * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Color(0xFF38CC66), // Green color
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 100,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLegendItem(
                      color: const Color(0xFFFFB946), // Yellow color
                      text: 'Pending',
                    ),
                    const SizedBox(height: 2),
                    _buildLegendItem(
                      color: const Color(0xFF38CC66), // Green color
                      text: 'Complete',
                    ),
                    const SizedBox(height: 2),
                    _buildLegendItem(
                      color: const Color(0xFFE74C3C), // Red color
                      text: 'Cancel',
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Rest of your widget code
        ],
      ),
    );
  }
  Widget _buildLegendItem({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
class _MultiSegmentCircularPainter extends CustomPainter {
  final double pendingPercent;
  final double completePercent;
  final double cancelPercent;

  _MultiSegmentCircularPainter({
    required this.pendingPercent,
    required this.completePercent,
    required this.cancelPercent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 75.0; // Updated radius
    double strokeWidth = 13.0; // The thickness of the circle

    double startAngle = -3.14 / 2;
    double sweepAnglePending = 2 * 3.14 * pendingPercent;
    double sweepAngleComplete = 2 * 3.14 * completePercent;
    double sweepAngleCancel = 2 * 3.14 * cancelPercent;

    final paintPending = Paint()
      ..color = Colors.yellow // Yellow color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintComplete = Paint()
      ..color =  Colors.green // Green color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintCancel = Paint()
      ..color = Colors.red// Red color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Define the rectangle that bounds the circle, ensuring it is centered
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2), // Center of the widget
      radius: radius - (strokeWidth / 2), // Adjust for stroke width
    );

    // Draw pending segment
    canvas.drawArc(rect, startAngle, sweepAnglePending, false, paintPending);

    // Draw complete segment
    startAngle += sweepAnglePending;
    canvas.drawArc(rect, startAngle, sweepAngleComplete, false, paintComplete);

    // Draw cancel segment
    startAngle += sweepAngleComplete;
    canvas.drawArc(rect, startAngle, sweepAngleCancel, false, paintCancel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
