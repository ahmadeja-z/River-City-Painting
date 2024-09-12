import 'package:flutter/material.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';

class ToDoItemWidget extends StatelessWidget {
  final String title;
  final String assignedTo;
  final String startDate;
  final String endDate;
  final String note;
  final VoidCallback onDelete;

  const ToDoItemWidget({
    super.key,
    required this.title,
    required this.assignedTo,
    required this.startDate,
    required this.endDate,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Assigned to: $assignedTo',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Start Date: $startDate',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'End Date: $endDate',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Note: $note',
            style: TextStyle(
              fontFamily: AppFonts.poppinsRegular,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
