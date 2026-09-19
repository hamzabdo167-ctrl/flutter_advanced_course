// import 'package:my_new_app/Features/login/data/models/login_request_body.dart';
// import 'package:my_new_app/Features/login/data/models/login_response.dart';
// import 'package:my_new_app/core/networking/api_errro_handler.dart';
// import 'package:my_new_app/core/networking/api_result.dart';
// import 'package:my_new_app/core/networking/api_service.dart';

// class LoginRepo {
//   final ApiService _apiService;

//   LoginRepo(this._apiService);

//   Future<ApiResult<LoginResponse>> login(
//     LoginRequestBody loginRequestBody,
//   ) async {
//     try {
//       final response = await _apiService.login(loginRequestBody);
//       return ApiResult.success(response as LoginResponse);
//     } catch (errro) {
//       return ApiResult.failure(ErrorHandler.handle(errro));
//     }
//   }
// }

import 'package:my_new_app/features/login/data/models/login_request_body.dart';
import 'package:my_new_app/features/login/data/models/login_response.dart';
import 'package:my_new_app/core/networking/api_errro_handler.dart';
import 'package:my_new_app/core/networking/api_result.dart';
import 'package:my_new_app/core/networking/api_service.dart';


class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response); // بدون casting
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}