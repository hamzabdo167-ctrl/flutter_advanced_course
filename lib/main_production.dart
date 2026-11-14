import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/di/dependency_injection.dart';
import 'package:my_new_app/core/helpers/constans.dart';
import 'package:my_new_app/core/helpers/extensions.dart';
import 'package:my_new_app/core/helpers/shared_pref_helper.dart';
import 'package:my_new_app/core/routing/app_router.dart';
import 'package:my_new_app/doc_app.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPreKeys.userToken,
  );
  if (userToken!.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
