part of 'add_station_cubit.dart';

@immutable
sealed class AddStationState {}

final class AddStationInitial extends AddStationState {}

final class AddStationLoading extends AddStationState {}

final class AddStationSuccess extends AddStationState {}

final class AddStationFailure extends AddStationState {
  final String errMessage;
  AddStationFailure(this.errMessage);
}
