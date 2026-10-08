import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/theming/styles.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorModel;
  const DoctorsListViewItem({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/doctor_placeholder.png',
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel?.name ?? 'Doctor Name',
                style: TextStyles.font12GrayMedium,
              ),
              Text(
                '${doctorModel?.degree} | ${doctorModel?.phone}',
                style: TextStyles.font12GrayMedium,
              ),
              Text(
                doctorModel?.email ?? 'Email',
                style: TextStyles.font12GrayMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
