import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;

  CustomRadioButton({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<bool>(
          value: value,
          groupValue: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
