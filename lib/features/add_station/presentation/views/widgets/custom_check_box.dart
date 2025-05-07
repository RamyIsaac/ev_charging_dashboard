import 'package:ev_charging_dashboard/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isCkecked,
    required this.onChange,
  });

  final bool isCkecked;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Checkbox(
          fillColor: isCkecked
              ? const WidgetStatePropertyAll(kSecondaryColor)
              : const WidgetStatePropertyAll(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isCkecked,
          onChanged: (value) {
            onChange(value ?? false);
          }),
    );
  }
}
