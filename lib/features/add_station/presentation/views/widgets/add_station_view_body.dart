import 'dart:io';

import 'package:ev_charging_dashboard/core/widgets/custom_button.dart';
import 'package:ev_charging_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ev_charging_dashboard/core/widgets/show_snack_bar.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/review_entity.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/manager/cubit/add_station_cubit.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/add_station_view.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/image_field.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/is_station_available.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStationViewBody extends StatefulWidget {
  const AddStationViewBody({super.key});

  @override
  State<AddStationViewBody> createState() => _AddStationViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

class _AddStationViewBodyState extends State<AddStationViewBody> {
  late String name = '', code = '', address = '';
  late num price, rating;
  bool isFeatured = false, isAvailable = false;
  File? fileImage;
  late double lat, lon;
  late int availableSlots;
  late List<String> chargingTypes;

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
                onSaved: (value) {
                  address = value!;
                },
                hintText: 'Station Address',
                label: const Text('Station Address'),
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Price',
                label: const Text('price'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  lat = double.parse(value!);
                },
                hintText: 'latitude',
                label: const Text('latitude'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  lon = double.parse(value!);
                },
                hintText: 'longitude',
                label: const Text('longitude'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  availableSlots = int.parse(value!);
                },
                hintText: 'available slots',
                label: const Text('available slots'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              // CustomTextFormField(
              //   onSaved: (value) {
              //     chargingTypes = value!.split(',');
              //   },
              //   hintText: 'Charging Types',
              //   label: const Text('Charging Types'),
              //   textInputType: TextInputType.number,
              // ),
              // const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Station code',
                label: const Text('Station code'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  rating = num.parse(value!);
                },
                hintText: 'rating',
                label: const Text('rating'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              IsStationAvailable(onChange: (value) {
                isAvailable = value;
              }),
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
                      AddStationInputEntity input = AddStationInputEntity(
                        name: name,
                        price: price,
                        address: address,
                        image: fileImage!,
                        code: code,
                        isFeatured: isFeatured,
                        isAvailable: isAvailable,
                        latitude: lat,
                        longitude: lon,
                        availableConnectors: availableSlots, rating: rating,
                        // chargingType: chargingTypes,
                        reviews: [
                          ReviewEntity(
                            reviewerName: 'Ramy',
                            imageUrl: 'https://i.pravatar.cc/300',
                            rating: 5, // Assuming rating is now a String
                            dateTime: DateTime.now(),
                            comment: 'good station',
                          ),
                        ],
                      );
                      context.read<AddStationCubit>().addStation(input);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showSnackBar(context, 'please select an image');
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
