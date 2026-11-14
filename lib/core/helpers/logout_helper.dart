import 'package:flutter/material.dart';
import 'package:my_new_app/core/helpers/shared_pref_helper.dart';
import 'package:my_new_app/core/networking/dio_factory.dart';

Future<void> logout(BuildContext context) async {
  await SharedPrefHelper.clearAllSecuredData();
  DioFactory.setTokenAfterLogin('');

  if (!context.mounted) return;
  Navigator.of(context).pushNamedAndRemoveUntil(
    '/loginScreen', // غيّره لاسم راوت اللوجن عندك
    (route) => false,
  );
}
