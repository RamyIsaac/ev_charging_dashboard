import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ev_charging_dashboard/core/errors/failures.dart';
import 'package:ev_charging_dashboard/core/repos/images_repo/images_repo.dart';

import 'package:ev_charging_dashboard/core/services/storage_service.dart';
import 'package:ev_charging_dashboard/core/utils/backend_end_points.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndPoints.images);
      return Right(url);
    } catch (e) {
      return const Left(ServerFailure('Failed to upload image'));
    }
  }
}
