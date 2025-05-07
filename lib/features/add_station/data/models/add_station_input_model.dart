// import 'dart:io';

// import 'package:ev_charging_dashboard/features/add_station/data/models/review_model.dart';
// import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';

// class AddStationInputModel {
//   final String name;
//   final num price;
//   final String address;
//   String? imageUrl;
//   final File image;
//   final String code;
//   final bool isFeatured;
//   final double latitude;
//   final double longitude;
//   final int availableConnectors;
//   final bool? isAvailable;
//   final String rating;
//   final bool? isActive;
//   // final List<String> chargingType;
//   final List<ReviewModel> reviews;

//   AddStationInputModel({
//     required this.name,
//     required this.price,
//     required this.address,
//     this.imageUrl,
//     required this.image,
//     required this.code,
//     required this.isFeatured,
//     required this.latitude,
//     required this.longitude,
//     required this.availableConnectors,
//     this.isAvailable,
//     required this.rating,
//     this.isActive,
//     //  required this.chargingType,
//     required this.reviews,
//   });

//   factory AddStationInputModel.fromEntity(AddStationInputEntity entity) {
//     return AddStationInputModel(
//       name: entity.stationName,
//       price: entity.price,
//       address: entity.address,
//       imageUrl: entity.imageUrl,
//       image: entity.image,
//       code: entity.code,
//       isFeatured: entity.isFeatured,
//       latitude: entity.latitude,
//       longitude: entity.longitude,
//       availableConnectors: entity.availableConnectors,
//       isAvailable: entity.isAvailable,
//       rating: entity.rating,
//       isActive: entity.isActive,
//       // chargingType: entity.chargingType,
//       reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
//     );
//   }

//   toJson() {
//     return {
//       'name': name,
//       'price': price,
//       'address': address,
//       'imageUrl': imageUrl,
//       'code': code,
//       'isFeatured': isFeatured,
//       'latitude': latitude,
//       'longitude': longitude,
//       'availableConnectors': availableConnectors,
//       // 'chargingType': chargingType,
//       'isAvailable': isAvailable,
//       'rating': rating,
//       'isActive': isActive,
//       'reviews': reviews.map((e) => e.toJson()).toList(),
//     };
//   }
// }

import 'dart:io';

import 'package:ev_charging_dashboard/features/add_station/data/models/review_model.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/charging_types_entity.dart';

class AddStationInputModel {
  final String stationName;
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
  final List<ReviewModel> reviews;
  // final List<String> chargingType;
  //final List<ReviewEntity> reviews;

  AddStationInputModel({
    required this.stationName,
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

  factory AddStationInputModel.fromEntity(AddStationInputEntity entity) {
    return AddStationInputModel(
      stationName: entity.name,
      price: entity.price,
      address: entity.address,
      imageUrl: entity.imageUrl,
      image: entity.image,
      code: entity.code,
      isFeatured: entity.isFeatured,
      latitude: entity.latitude,
      longitude: entity.longitude,
      availableConnectors: entity.availableConnectors,
      isAvailable: entity.isAvailable,
      rating: entity.rating,
      isActive: entity.isActive,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      // chargingType: entity.chargingType,
      // reviews: entity.reviews,
    );
  }

  factory AddStationInputModel.fromJson(Map<String, dynamic> json) {
    return AddStationInputModel(
      stationName: json['stationName'],
      price: json['price'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      image: json['image'] as File,
      code: json['code'],
      isFeatured: json['isFeatured'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      availableConnectors: json['availableConnectors'],
      isAvailable: json['isAvailable'],
      rating: json['rating'],
      isActive: json['isActive'],

      // chargingType: json['chargingType'],
      reviews: json['reviews'],
    );
  }

  toJson() {
    return {
      'stationName': stationName,
      'price': price,
      'address': address,
      'imageUrl': imageUrl,
      // 'image': image,
      'code': code,
      'isFeatured': isFeatured,
      'latitude': latitude,
      'longitude': longitude,
      'availableConnectors': availableConnectors,
      // 'chargingType': chargingType,
      'isAvailable': isAvailable,
      'rating': rating,
      'isActive': isActive,

      'reviews': reviews.map((e) => e.toJson()).toList(),
      //   'reviews': reviews,
    };
  }
}
