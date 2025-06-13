import 'package:bloc/bloc.dart';
import '../data/models/search_products_model.dart';
import '../data/repos/search_products_repo.dart';
import 'search_products_state.dart';
import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';

class SearchProductsCubit
    extends Cubit<SearchProductsState<SearchProductsModel>> {
  final SearchProductsRepo searchProductsRepo;
  int currentPage = 1;
  final int pageSize = 10;
  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<ProductData> allSearchedProducts = [];
  String? lastSearchQuery;

  SearchProductsCubit(this.searchProductsRepo) : super(const Idle());

  void resetToInitialState() {
    currentPage = 1;
    hasReachedMax = false;
    isLoadingMore = false;
    allSearchedProducts.clear();
    lastSearchQuery = null;
    emit(const SearchProductsState.idle());
  }

  Future<void> getProductsBySearch({
    bool isInitialLoad = true,
    required String searchedProduct,
  }) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    if (isInitialLoad && searchedProduct == lastSearchQuery) return;

    isLoadingMore = true;
    lastSearchQuery = searchedProduct;

    if (isInitialLoad) {
      emit(const SearchProductsState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allSearchedProducts.clear();
    } else {
      emit(
        SearchProductsState.loadingMore(
          SearchProductsModel(data: ProductsModel(data: allSearchedProducts)),
        ),
      );
    }

    try {
      var data = await searchProductsRepo.getProductsBySearch(
        currentPage,
        pageSize,
        searchedProduct,
      );

      data.when(
        success: (SearchProductsModel newSearchedProducts) {
          final newProducts = newSearchedProducts.data?.data ?? [];

          if (isInitialLoad) {
            allSearchedProducts = newProducts;
          } else {
            allSearchedProducts.addAll(newProducts);
          }

          hasReachedMax = newProducts.length < pageSize;
          currentPage++;

          emit(
            SearchProductsState.success(
              SearchProductsModel(
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
            SearchProductsState.error(
              ApiNetworkExceptions.getDioException(errorModel)
                  as ApiNetworkExceptions,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        SearchProductsState.error(
          ApiNetworkExceptions.getDioException(e) as ApiNetworkExceptions,
        ),
      );
    } finally {
      isLoadingMore = false;
    }
  }
}
