import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/core/helpers/spacing.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/logic/home_cubit.dart';
import 'package:my_new_app/features/home/logic/home_state.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:my_new_app/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'speciality_list_view.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationDataList) {
            var specializationsList = specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsList) {
    return DoctorsSpecialityListView(
      specializationsDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
