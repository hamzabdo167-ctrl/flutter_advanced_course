import 'package:flutter/material.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
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
