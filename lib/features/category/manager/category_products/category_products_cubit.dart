import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/category_products/category_products_model.dart';
import '../../data/repos/category_products_repo.dart';
import 'category_products_state.dart';

class CategoryProductsCubit
    extends Cubit<CategoryProductsState<CategoryProductsModel>> {
  final CategoryProductsRepo categoryProductsRepo;
  int currentPage = 1;
  final int pageSize = 10;
  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<ProductData> allSearchedProducts = [];
  String? lastSearchQuery;

  CategoryProductsCubit(this.categoryProductsRepo) : super(const Idle());

  void resetToInitialState() {
    currentPage = 1;
    hasReachedMax = false;
    isLoadingMore = false;
    allSearchedProducts.clear();
    lastSearchQuery = null;
    emit(const CategoryProductsState.idle());
  }

  Future<void> getCategoryProducts({
    bool isInitialLoad = true,
    required int categoryId,
  }) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    isLoadingMore = true;

    if (isInitialLoad) {
      emit(const CategoryProductsState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allSearchedProducts.clear();
    } else {
      emit(
        CategoryProductsState.loadingMore(
          CategoryProductsModel(data: ProductsModel(data: allSearchedProducts)),
        ),
      );
    }

    try {
      var data = await categoryProductsRepo.getCategoryProducts(
        currentPage,
        pageSize,
        categoryId,
      );

      data.when(
        success: (CategoryProductsModel newCategoryProducts) {
          final newProducts = newCategoryProducts.data?.data ?? [];

          if (isInitialLoad) {
            allSearchedProducts = newProducts;
          } else {
            allSearchedProducts.addAll(newProducts);
          }

          hasReachedMax = newProducts.length < pageSize;
          currentPage++;

          emit(
            CategoryProductsState.success(
              CategoryProductsModel(
                data: ProductsModel(
                  data: allSearchedProducts,
                  pageSize: pageSize,
                  pageIndex: currentPage - 1,
                  count: allSearchedProducts.length,
                ),
              ),
            ),
          );
        },
        failure: (ApiErrorModel errorModel) {
          emit(
            CategoryProductsState.error(
              ApiNetworkExceptions.getDioException(errorModel)
                  as ApiNetworkExceptions,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        CategoryProductsState.error(
          ApiNetworkExceptions.getDioException(e) as ApiNetworkExceptions,
        ),
      );
    } finally {
      isLoadingMore = false;
    }
  }
}
