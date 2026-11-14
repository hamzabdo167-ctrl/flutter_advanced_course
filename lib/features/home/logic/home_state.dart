import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_new_app/core/networking/api_errro_handler.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    List<SpecializationsData?>? specializationDataList,
  ) = SpecializationSuccess;
  const factory HomeState.specializationError(ErrorHandler errorHandler) =
      SpecializationError;

  // Doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsDataList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError(ErrorHandler errorHandler) =
      DoctorsError;
}
