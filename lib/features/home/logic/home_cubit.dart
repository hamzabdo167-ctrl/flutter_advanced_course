// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_new_app/features/home/data/repos/home_repo.dart';
// import 'package:my_new_app/features/home/logic/home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo _homeRepo;
//   HomeCubit(Object object, {required this._homeRepo}) : super(HomeState.initial());

//   void getSpecializations() async {
//     emit(HomeState.specializationLoading());
//     final response = await _homeRepo.getSpecializations();

//     response.when(
//       success: (specializationsResponseModel) {
//         emit(HomeState.specializationSuccess(specializationsResponseModel));
//       },
//       failure: (errorHandler) {
//         emit(HomeState.specializationError(errorHandler));
//       },
//     );
//   }
// }

// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/features/home/data/repos/home_repo.dart'; // ✅ تأكد من وجود هذا السطر
import 'package:my_new_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());

    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }
}
