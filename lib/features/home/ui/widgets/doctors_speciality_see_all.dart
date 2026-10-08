import 'package:flutter/material.dart';
import 'package:my_new_app/core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          Text('Doctors Speciality', style: TextStyles.font18DarkBlueSemiBold),
          const Spacer(),
          Text('See All', style: TextStyles.font12BlueRegular),
        ],
      ),
    );
  }
}
