import 'package:dartz/dartz.dart';
import 'package:ev_charging_dashboard/core/errors/failures.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';

abstract class StationsRepo {
  Future<Either<Failure, void>> addStation(AddStationInputEntity inputEntity);
}
