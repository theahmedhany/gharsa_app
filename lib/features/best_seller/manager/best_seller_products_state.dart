import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/networking/api_network_exceptions.dart';

part 'best_seller_products_state.freezed.dart';

@freezed
class BestSellerProductsState<T> with _$BestSellerProductsState<T> {
  const factory BestSellerProductsState.idle() = Idle<T>;
  const factory BestSellerProductsState.loading() = Loading<T>;
  const factory BestSellerProductsState.loadingMore(T data) = LoadingMore<T>;
  const factory BestSellerProductsState.success(T data) = Success<T>;
  const factory BestSellerProductsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
