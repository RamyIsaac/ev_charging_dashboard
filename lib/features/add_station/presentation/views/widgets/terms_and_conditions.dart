import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
    required this.onChange,
  });
  final ValueChanged<bool> onChange;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: CustomCheckBox(
            onChange: (value) {
              isTermsAccepted = value;
              widget.onChange(value);
              setState(() {});
            },
            isCkecked: isTermsAccepted,
          ),
        ),
        const Expanded(
          child: Text(
            ' Station is Featured ? ',
          ),
        ),
      ],
    );
  }
}
