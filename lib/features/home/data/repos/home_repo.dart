import 'package:my_new_app/core/networking/api_errro_handler.dart';
import 'package:my_new_app/core/networking/api_result.dart';
import 'package:my_new_app/features/home/data/apis/home_api_services.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  HomeRepo(this._homeApiServices);
  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiServices.getSpecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}