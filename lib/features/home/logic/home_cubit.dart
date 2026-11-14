import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/core/helpers/extensions.dart';
import 'package:my_new_app/core/networking/api_errro_handler.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/data/repos/home_repo.dart'; // ✅ تأكد من وجود هذا السطر
import 'package:my_new_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationList = [];

  void getSpecializations({int? specializationId}) async {
    emit(const HomeState.specializationLoading());

    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsResponseModel) {
        specializationList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list of the first specialization by default.
        getDoctorsList(specializationId: specializationList?.first?.id);

        emit(HomeState.specializationSuccess(specializationList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorListByrSpecializationId(
      specializationId,
    );

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(
        HomeState.doctorsError(
          ErrorHandler.handle(
            "No doctors found for the selected specialization.",
          ),
        ),
      );
    }
  }

  ///returns the doctors list of doctors of the based on the specialization id
  getDoctorListByrSpecializationId(specializationId) {
    return specializationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
