import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_new_app/core/helpers/spacing.dart';
import 'package:my_new_app/core/theming/colors.dart';
import 'package:my_new_app/core/theming/styles.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final SpecializationsData? specializationData;

  const SpecialityListViewItem({
    super.key,
    required this.selectedIndex,
    required this.itemIndex,
    this.specializationData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 10 : 24.w,
        end: 10.w,
      ),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/general_speciality.svg',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationData?.name ?? 'Specialization',
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
