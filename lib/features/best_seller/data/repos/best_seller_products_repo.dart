import '../models/best_seller_products_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class BestSellerProductsRepo {
  final ApiServices apiServices;

  BestSellerProductsRepo(this.apiServices);

  Future<ApiResult<BestSellerProducts>> getProducts(
    int pageIndex,
    int pageSize,
  ) async {
    try {
      var response = await apiServices.getProducts(pageIndex, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
