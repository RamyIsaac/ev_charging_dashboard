import 'package:ev_charging_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:ev_charging_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:ev_charging_dashboard/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging_dashboard/core/repos/stations_repo/stations_repo_impl.dart';
import 'package:ev_charging_dashboard/core/services/database_service.dart';
import 'package:ev_charging_dashboard/core/services/fire_storage.dart';
import 'package:ev_charging_dashboard/core/services/firestore_service.dart';
import 'package:ev_charging_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorage());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StorageService>()));

  getIt.registerSingleton<StationsRepo>(
      StationsRepoImpl(getIt.get<DatabaseService>()));
}
