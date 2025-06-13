import 'package:dio/dio.dart';
import '../../features/category/data/models/all_categories/all_categories_model.dart';
import '../../features/category/data/models/category_products/category_products_model.dart';
import '../../features/details/data/models/product_details_model.dart';
import '../../features/order/data/models/new_order_request_body.dart';
import '../../features/order/data/models/new_order_response.dart';
import '../../features/search/data/models/search_products_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/best_seller/data/models/best_seller_products_model.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/signup/data/models/signup_response.dart';
import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Get Best Seller Products API
  @GET(ApiConstants.apiBestSellerProducts)
  Future<BestSellerProducts> getProducts(
    @Query("PageIndex") int pageIndex,
    @Query("PageSize") int pageSize,
  );

  // Get Products By Search API
  @GET(ApiConstants.apiSearchProducts)
  Future<SearchProductsModel> getProductsBySearch(
    @Query("PageIndex") int pageIndex,
    @Query("PageSize") int pageSize,
    @Query("SearchName") String searchedItem,
  );

  // Get All Categories API
  @GET(ApiConstants.apiAllCategories)
  Future<List<AllCategoriesModel>> getAllCategories();

  // Get Products By Category API
  @GET(ApiConstants.apiCategoryProducts)
  Future<CategoryProductsModel> getCategoryProducts(
    @Query("PageIndex") int pageIndex,
    @Query("PageSize") int pageSize,
    @Query("CategoryId") int categoryId,
  );

  // Get Product Details API
  @GET('${ApiConstants.apiProductDetails}/{id}')
  Future<ProductDetailsModel> getProductDetails(@Path('id') int productId);

  // New Order API
  @POST(ApiConstants.apiNewOrder)
  Future<NewOrderResponse> newOrder(
    @Body() NewOrderRequestBody newOrderRequestBody,
  );

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup API
  @POST(ApiConstants.apiSignup)
  @MultiPart()
  Future<SignupResponse> signup(@Body() FormData formData);
}
