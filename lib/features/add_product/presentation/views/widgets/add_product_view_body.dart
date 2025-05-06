import 'dart:io';

import 'package:ev_charging_dashboard/core/widgets/custom_button.dart';
import 'package:ev_charging_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ev_charging_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ev_charging_dashboard/features/add_product/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, code, address;
  late num price;
  bool isFeatured = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: ' Station Name',
                label: const Text('Station Name'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (address) {
                  address = address!;
                },
                hintText: 'Station Address',
                label: const Text('Station Address'),
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (price) {
                  price = num.parse(price!).toString();
                },
                hintText: 'Price',
                label: const Text('price'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  value = value!.toLowerCase();
                },
                hintText: 'Station code',
                label: const Text('Station code'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              TermsAndConditions(onChange: (value) {
                isFeatured = value;
              }),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  fileImage = image;
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Add Station',
                onTap: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Add Image'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
