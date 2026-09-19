import 'package:my_new_app/core/networking/api_errro_handler.dart';
import 'package:my_new_app/core/networking/api_result.dart';
import 'package:my_new_app/core/networking/api_service.dart';
import 'package:my_new_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:my_new_app/features/sign_up/data/models/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
