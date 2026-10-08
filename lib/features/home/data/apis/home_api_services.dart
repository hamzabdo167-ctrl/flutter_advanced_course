
import 'package:dio/dio.dart';
import 'package:my_new_app/core/networking/api_constants.dart';
import 'package:my_new_app/features/home/data/apis/home_api_constants.dart';
import 'package:my_new_app/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/http.dart';
part 'home_api_services.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)

abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) = _HomeApiServices;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecializations();
}