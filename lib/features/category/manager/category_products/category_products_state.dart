import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_network_exceptions.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState<T> with _$CategoryProductsState<T> {
  const factory CategoryProductsState.idle() = Idle<T>;
  const factory CategoryProductsState.loading() = Loading<T>;
  const factory CategoryProductsState.loadingMore(T data) = LoadingMore<T>;
  const factory CategoryProductsState.success(T data) = Success<T>;
  const factory CategoryProductsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
