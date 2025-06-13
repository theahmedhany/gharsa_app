import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/best_seller_products_model.dart';
import '../../manager/best_seller_products_cubit.dart';
import '../../manager/best_seller_products_state.dart';

import '../widgets/best_seller_products_card.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<BestSellerProductsCubit>().emitGetAllProducts(
      isInitialLoad: true,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<BestSellerProductsCubit>().emitGetAllProducts(
        isInitialLoad: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'الأكثر مبيعاً',
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        child: BlocConsumer<
          BestSellerProductsCubit,
          BestSellerProductsState<BestSellerProducts>
        >(
          listener: (context, state) {
            // Handle state changes if needed
          },
          builder: (context, state) {
            final cubit = context.read<BestSellerProductsCubit>();

            return state.when(
              idle: () => const Center(child: CustomProgressIndicator()),
              loading: () => const Center(child: CustomProgressIndicator()),
              loadingMore: (products) {
                return _buildProductGrid(
                  products: products.data?.data ?? [],
                  cubit: cubit,
                  isLoadingMore: true,
                );
              },
              success: (products) {
                return _buildProductGrid(
                  products: products.data?.data ?? [],
                  cubit: cubit,
                  isLoadingMore: false,
                );
              },
              error: (error) {
                return Center(
                  child: Text(
                    error.toString(),
                    style: TextStyle(
                      color: AppColors.kMainPrimaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductGrid({
    required List<ProductData> products,
    required BestSellerProductsCubit cubit,
    required bool isLoadingMore,
  }) {
    return RefreshIndicator(
      color: AppColors.kMainPrimaryColor,
      onRefresh: () async {
        cubit.emitGetAllProducts(isInitialLoad: true);
      },
      child: GridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 10.r, bottom: 24.r),
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length + (cubit.hasReachedMax ? 0 : 1),
        itemBuilder: (_, index) {
          if (index >= products.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomProgressIndicator(),
              ),
            );
          }

          final product = products[index];
          String imageUrl = product.pictureUrl ?? '';
          imageUrl = imageUrl.replaceFirst('https://', 'http://');

          return BestSellerProductsCard(
            imageSrc: imageUrl,
            title:
                (product.name != null && product.name!.length > 10)
                    ? '${product.name?.substring(0, 10)}...'
                    : product.name ?? '',

            price: product.price ?? 0.0,
            id: product.productId ?? 0,
            categoryName: product.categoryName ?? '',
          );
        },
      ),
    );
  }
}
