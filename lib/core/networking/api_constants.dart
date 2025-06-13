class ApiConstants {
  static const String apiBaseUrl = "https://agricommerce.runasp.net/api/";

  static const String apiBestSellerProducts = "Product";
  static const String apiSearchProducts = "Product";
  static const String apiAllCategories = "Category";
  static const String apiCategoryProducts = "Product";
  static const String apiProductDetails = "Product";
  static const String apiNewOrder = "Order";

  static const String apiLogin = "Account/login";
  static const String apiSignup = "Account/register";
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
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
