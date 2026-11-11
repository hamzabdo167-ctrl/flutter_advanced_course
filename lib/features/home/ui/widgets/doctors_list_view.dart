import 'package:flutter/material.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    final list = doctorsList ?? [];
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(doctorModel: list[index]);
        },
      ),
    );
  }
}
