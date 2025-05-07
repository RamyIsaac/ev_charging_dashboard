import 'package:ev_charging_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:ev_charging_dashboard/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging_dashboard/core/services/get_it_service.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/manager/cubit/add_station_cubit.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/add_station_view_body.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/add_station_view_body_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStationView extends StatelessWidget {
  const AddStationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddStationCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<StationsRepo>(),
        ),
        child:const  AddStationViewBodyBloc(),
      ),
    );
  }
}
