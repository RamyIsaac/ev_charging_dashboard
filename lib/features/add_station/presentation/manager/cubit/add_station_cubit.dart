import 'package:bloc/bloc.dart';
import 'package:ev_charging_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:ev_charging_dashboard/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';
import 'package:flutter/material.dart';

part 'add_station_state.dart';

class AddStationCubit extends Cubit<AddStationState> {
  final ImagesRepo imagesRepo;
  final StationsRepo stationsRepo;

  AddStationCubit(this.imagesRepo, this.stationsRepo)
      : super(AddStationInitial());

  Future<void> addStation(AddStationInputEntity inputEntity) async {
    emit(AddStationLoading());
    var result = await imagesRepo.uploadImage(inputEntity.image);
    result.fold(
      (e) {
        emit(
          AddStationFailure(
            e.errMessage,
          ),
        );
      },
      (url) async {
        inputEntity.imageUrl = url;
        var result = await stationsRepo.addStation(inputEntity);
        result.fold(
          (e) => emit(AddStationFailure(e.toString())),
          (r) => emit(
            AddStationSuccess(),
          ),
        );
      },
    );
  }
}
