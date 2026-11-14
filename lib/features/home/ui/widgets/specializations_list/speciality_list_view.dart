import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/logic/home_cubit.dart';
import 'package:my_new_app/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsDataList,
  });

  @override
  State<DoctorsSpecialityListView> createState() =>
      _DoctorsSpecialityListViewState();
}

class _DoctorsSpecialityListViewState extends State<DoctorsSpecialityListView> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationsDataList[index]?.id,
              );
            },
            child: SpecialityListViewItem(
              specializationData: widget.specializationsDataList[index],
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
