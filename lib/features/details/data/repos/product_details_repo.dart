import '../models/product_details_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class ProductDetailsRepo {
  final ApiServices apiServices;

  ProductDetailsRepo(this.apiServices);

  Future<ApiResult<ProductDetailsModel>> getProductDetails(
    int productId,
  ) async {
    try {
      var response = await apiServices.getProductDetails(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
