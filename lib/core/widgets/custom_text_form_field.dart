import 'package:ev_charging_dashboard/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.textInputType,
      this.suffixIcon,
      this.label,
      this.onSaved,
      this.obscureText = false,
      this.maxLines = 1});
  final String hintText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? label;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required Field';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: label,
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kSecondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
