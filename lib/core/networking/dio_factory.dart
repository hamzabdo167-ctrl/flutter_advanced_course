import 'package:dio/dio.dart';
import 'package:my_new_app/core/helpers/constans.dart';
import 'package:my_new_app/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  /// تحديث الهيدر فورياً بعد الـ Login/SignUp
  static void setTokenAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void addDioInterceptor() {
    // 1. قراءة التوكن وحقنه قبل كل طلب (Request)
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await SharedPrefHelper.getSecuredString(
            SharedPreKeys.userToken,
          );

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );

    // 2. Logging
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
