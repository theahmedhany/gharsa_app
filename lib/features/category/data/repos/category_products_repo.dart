import '../models/category_products/category_products_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class CategoryProductsRepo {
  final ApiServices apiServices;

  CategoryProductsRepo(this.apiServices);

  Future<ApiResult<CategoryProductsModel>> getCategoryProducts(
    int pageIndex,
    int pageSize,
    int categoryId,
  ) async {
    try {
      var response = await apiServices.getCategoryProducts(
        pageIndex,
        pageSize,
        categoryId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
