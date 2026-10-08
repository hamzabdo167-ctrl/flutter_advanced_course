import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/helpers/spacing.dart';
import 'package:my_new_app/core/theming/styles.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 175.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 165.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/home_blue_pattern.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book and\nschedule with\nnearest doctor',
                    style: TextStyles
                        .font18WhiteMedium, // ✅ تم إزالة الفاصلة المنقوطة المفردة
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 9.h,
                        ),
                      ),
                      child: Text(
                        'Find Nearb',
                        style: TextStyles.font12BlueRegular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: -9.h,
              child: Image.asset(
                'assets/images/home_doctor.png',
                height: 210.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
