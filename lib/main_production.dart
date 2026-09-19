// import 'package:flutter/material.dart';
// import 'package:my_new_app/core/di/dependency_injection.dart';
// import 'package:my_new_app/core/routing/app_router.dart';
// import 'package:my_new_app/doc_app.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   setupGetIt();
//   runApp(DocApp(appRouter: AppRouter()));
// }

import 'package:flutter/material.dart';
import 'package:my_new_app/core/di/dependency_injection.dart';
import 'package:my_new_app/core/routing/app_router.dart';
import 'package:my_new_app/doc_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupGetIt(); // تأكد لو setupGetIt بتانوّع async أو لا
  } catch (e) {
    debugPrint("CRASH IN MAIN: $e");
  }

  runApp(DocApp(appRouter: AppRouter()));
}
