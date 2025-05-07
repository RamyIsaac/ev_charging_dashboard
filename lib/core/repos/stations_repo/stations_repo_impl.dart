import 'package:dartz/dartz.dart';
import 'package:ev_charging_dashboard/core/errors/failures.dart';
import 'package:ev_charging_dashboard/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging_dashboard/core/services/database_service.dart';
import 'package:ev_charging_dashboard/core/utils/backend_end_points.dart';
import 'package:ev_charging_dashboard/features/add_station/data/models/add_station_input_model.dart';
import 'package:ev_charging_dashboard/features/add_station/domain/entities/add_station_input_entity.dart';

class StationsRepoImpl extends StationsRepo {
  final DatabaseService databaseService;

  StationsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addStation(
      AddStationInputEntity inputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.addStation,
        data: AddStationInputModel.fromEntity(inputEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to add station'));
    }
  }
}
