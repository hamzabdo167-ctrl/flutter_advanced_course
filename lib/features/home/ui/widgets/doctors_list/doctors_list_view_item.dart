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
          Container(
            width: 80, // عرض المربع أو المستطيل
            height: 80, // الطول (لو قد العرض هيبقى سكوير/مربع)
            decoration: BoxDecoration(
              color: Colors.blue, // لون الخلفية أو المكان اللي هيتحط فيه الصورة
              borderRadius: BorderRadius.circular(
                15,
              ), // انحناء الزوايا (كل ما الرقم صغر، كل ما الزوايا بقت حادة أكتر)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                15,
              ), // نفس الانحناء عشان لو جوّه صورة تقوس معاها
              child: Image.asset(
                'assets/images/doctor_placeholder.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
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
