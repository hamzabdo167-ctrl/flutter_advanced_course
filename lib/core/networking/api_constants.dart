class ApiConstants {
  static const String apiBaseUrl =
      "https://f8429a13-2707-446d-a5af-3d9c68beb809.mock.pstmn.io/";

  static const String login = "api/auth/login";
  static const String signup = "api/auth/register";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "حدث خطأ غير متوقع، برجاء المحاولة لاحقاً";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
