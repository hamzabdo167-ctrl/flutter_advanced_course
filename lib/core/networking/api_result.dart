import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_new_app/core/networking/api_errro_handler.dart'; // تعديل errro -> error
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
