import 'dart:io';

import 'package:ev_charging_dashboard/features/add_station/domain/entities/review_entity.dart';

class AddStationInputEntity {
  final String name;
  final num price;
  final String address;
  String? imageUrl;
  final File image;
  final String code;
  final bool isFeatured;
  final double latitude;
  final double longitude;
  final int availableConnectors;
  bool? isAvailable;
  num rating = 0;
  bool? isActive;
  final List<ReviewEntity> reviews;
  // final List<String> chargingType;
  // final List<ReviewEntity> reviews;

  AddStationInputEntity({
    required this.name,
    required this.price,
    required this.address,
    this.imageUrl,
    required this.image,
    required this.code,
    required this.isFeatured,
    required this.latitude,
    required this.longitude,
    required this.availableConnectors,
    //  required this.chargingType,
    this.isActive,
    this.isAvailable,
    required this.rating,
    required this.reviews,
    // required this.reviews,
  });
}
