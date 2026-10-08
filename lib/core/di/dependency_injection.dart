// import 'package:dio/dio.dart';

// import 'package:get_it/get_it.dart';
// import 'package:my_new_app/core/networking/api_service.dart';
// import 'package:my_new_app/core/networking/dio_factory.dart';
// import '../../features/login/data/repos/login_repo.dart';
// import '../../features/login/logic/cubit/login_cubit.dart';
// import '../../features/sign_up/data/repos/sign_up_repo.dart';
// import '../../features/sign_up/logic/sign_up_cubit.dart';

// final getIt = GetIt.instance;

// Future<void> setupGetIt() async {
//   // Dio & ApiService
//   Dio dio = DioFactory.getDio();
//   getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//   // login
//   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
//   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//   // signup
//   getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
//   getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

//   // home
//   // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
//   // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
// }

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_new_app/core/networking/api_constants.dart';
import 'package:my_new_app/core/networking/api_service.dart';
import 'package:my_new_app/core/networking/dio_factory.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Dio & ApiService
  Dio dio = DioFactory.getDio();
  dio.options.baseUrl =
      ApiConstants.apiBaseUrl; // إجبار Dio على قراءة رابط Postman

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // 2. Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // 3. Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
