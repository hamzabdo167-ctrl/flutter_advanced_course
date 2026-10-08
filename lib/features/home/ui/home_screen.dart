import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/helpers/spacing.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:my_new_app/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeTopBar(),
            const DoctorsBlueContainer(),
            verticalSpace(24.h),
            const DoctorsSpecialitySeeAll(),
            verticalSpace(18),
            const DoctorsSpecialityListView(),
            verticalSpace(8),
            const DoctorsListView(),
          ],
        ),
      ),
    );
  }
}
