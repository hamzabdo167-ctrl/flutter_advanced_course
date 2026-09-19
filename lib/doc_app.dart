import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 1. لا تنسَ استيراد المكتبة
import 'package:my_new_app/core/routing/app_router.dart';
import 'package:my_new_app/core/routing/routes.dart';
import 'package:my_new_app/core/theming/colors.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // 2. استخدام ScreenUtilInit وتغليف MaterialApp بها
    return ScreenUtilInit(
      designSize: const Size(375, 812), // تعديل مقاس العرض إلى 375
      minTextAdapt: true,
      child: MaterialApp(
          title: 'Doc App',
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}