// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_new_app/core/helpers/spacing.dart';
// import 'package:my_new_app/core/theming/colors.dart';
// import 'package:shimmer/shimmer.dart';

// class DoctorsShimmerLoading extends StatelessWidget {
//   const DoctorsShimmerLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: Row(
//               children: [
//                 Shimmer.fromColors(
//                   baseColor: ColorsManager.lightBlue,
//                   highlightColor: Colors.white,
//                   child: Container(
//                     width: 110,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12.0),
//                       shape: BoxShape.rectangle,
//                     ),
//                   ),
//                 ),
//                 horizontalSpace(16.0),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray,
//                         highlightColor: Colors.white,
//                         child: Container(
//                           width: 180.w,
//                           height: 180.h,
//                           decoration: BoxDecoration(
//                             color: ColorsManager.lightGray,
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                         ),
//                       ),
//                       verticalSpace(12.0),
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray,
//                         highlightColor: Colors.white,
//                         child: Container(
//                           width: 160.w,
//                           height: 14.0.h,
//                           decoration: BoxDecoration(
//                             color: ColorsManager.lightGray,
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                         ),
//                       ),
//                       verticalSpace(12.0),
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray,
//                         highlightColor: Colors.white,
//                         child: Container(
//                           width: 160.w,
//                           height: 14.0.h,
//                           decoration: BoxDecoration(
//                             color: ColorsManager.lightGray,
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/helpers/spacing.dart';
import 'package:my_new_app/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. شيمر الصورة (المستطيل ذو الزوايا المنحنية على الشمال)
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                horizontalSpace(16.0),

                // 2. شيمر النصوص والبيانات على اليمين
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الاسم
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 180.w,
                          height: 18.0.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      verticalSpace(12.0),

                      // التخصص
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 140.w,
                          height: 14.0.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      verticalSpace(12.0),

                      // البريد الإلكتروني أو التليفون
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 100.w,
                          height: 14.0.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
