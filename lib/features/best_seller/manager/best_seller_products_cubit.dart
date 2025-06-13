import 'package:bloc/bloc.dart';
import '../data/models/best_seller_products_model.dart';
import '../data/repos/best_seller_products_repo.dart';
import 'best_seller_products_state.dart';
import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';

class BestSellerProductsCubit
    extends Cubit<BestSellerProductsState<BestSellerProducts>> {
  final BestSellerProductsRepo productsRepo;
  int currentPage = 1;
  final int pageSize = 10;
  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<ProductData> allProducts = [];

  BestSellerProductsCubit(this.productsRepo) : super(const Idle());

  Future<void> emitGetAllProducts({bool isInitialLoad = true}) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    isLoadingMore = true;

    if (isInitialLoad) {
      emit(const BestSellerProductsState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allProducts.clear();
    }

    var data = await productsRepo.getProducts(currentPage, pageSize);

    data.when(
      success: (BestSellerProducts newProducts) {
        final newProductData = newProducts.data?.data ?? [];

        if (isInitialLoad) {
          allProducts = newProductData;
        } else {
          allProducts.addAll(newProductData);
        }

        hasReachedMax = newProductData.length < pageSize;
        currentPage++;

        final updatedProducts = BestSellerProducts(
          data: ProductsModel(
            data: allProducts,
            pageSize: newProducts.data?.pageSize,
            pageIndex: newProducts.data?.pageIndex,
            count: newProducts.data?.count,
          ),
        );
        emit(BestSellerProductsState.success(updatedProducts));
        isLoadingMore = false;
      },
      failure: (ApiErrorModel errorModel) {
        emit(BestSellerProductsState.error(errorModel as ApiNetworkExceptions));
        isLoadingMore = false;
      },
    );
  }
}
