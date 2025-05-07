import 'package:ev_charging_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:ev_charging_dashboard/core/widgets/show_snack_bar.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/manager/cubit/add_station_cubit.dart';
import 'package:ev_charging_dashboard/features/add_station/presentation/views/widgets/add_station_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStationViewBodyBloc extends StatefulWidget {
  const AddStationViewBodyBloc({
    super.key,
  });

  @override
  State<AddStationViewBodyBloc> createState() => _AddStationViewBodyBlocState();
}

class _AddStationViewBodyBlocState extends State<AddStationViewBodyBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStationCubit, AddStationState>(
      listener: (context, state) {
        if (state is AddStationSuccess) {
          showSnackBar(context, 'station added successfully');
        }
        if (state is AddStationFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddStationLoading,
            child: const AddStationViewBody());
      },
    );
  }
}
