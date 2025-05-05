import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

class _AddProductViewBodyState extends State<AddProductViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
