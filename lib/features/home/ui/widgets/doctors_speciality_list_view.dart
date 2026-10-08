import 'package:flutter/material.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsDataList, required SpecializationsResponseModel specializationDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            itemIndex: index,
            specializationData: specializationsDataList[index],
          );
        },
      ),
    );
  }
}
