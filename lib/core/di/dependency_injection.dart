import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/best_seller/data/repos/best_seller_products_repo.dart';
import '../../features/best_seller/manager/best_seller_products_cubit.dart';
import '../../features/category/data/repos/all_categories_repo.dart';
import '../../features/category/data/repos/category_products_repo.dart';
import '../../features/category/manager/all_categories/all_categories_cubit.dart';
import '../../features/category/manager/category_products/category_products_cubit.dart';
import '../../features/details/data/repos/product_details_repo.dart';
import '../../features/details/manager/product_details_cubit.dart';
import '../../features/order/data/repos/new_order_repo.dart';
import '../../features/order/manager/new_order_cubit.dart';
import '../../features/search/data/repos/search_products_repo.dart';
import '../../features/search/manager/search_products_cubit.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/manager/login_cubit.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/signup/manager/signup_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Best Seller Products
  getIt.registerLazySingleton<BestSellerProductsRepo>(
    () => BestSellerProductsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<BestSellerProductsCubit>(
    () => BestSellerProductsCubit(getIt<BestSellerProductsRepo>()),
  );

  // Search
  getIt.registerLazySingleton<SearchProductsRepo>(
    () => SearchProductsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<SearchProductsCubit>(
    () => SearchProductsCubit(getIt<SearchProductsRepo>()),
  );

  // All Categories
  getIt.registerLazySingleton<AllCategoriesRepo>(
    () => AllCategoriesRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<AllCategoriesCubit>(
    () => AllCategoriesCubit(getIt<AllCategoriesRepo>()),
  );

  // Category Products
  getIt.registerLazySingleton<CategoryProductsRepo>(
    () => CategoryProductsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<CategoryProductsCubit>(
    () => CategoryProductsCubit(getIt<CategoryProductsRepo>()),
  );

  // Product Details
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt<ProductDetailsRepo>()),
  );

  // New Order
  getIt.registerLazySingleton<NewOrderRepo>(() => NewOrderRepo(getIt()));
  getIt.registerFactory<NewOrderCubit>(() => NewOrderCubit(getIt()));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
