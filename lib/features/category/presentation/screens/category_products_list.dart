import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../widgets/category_products_card.dart';
import '../../manager/category_products/category_products_cubit.dart';
import '../../manager/category_products/category_products_state.dart';
import '../../data/models/category_products/category_products_model.dart';

class CategoryProductsList extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const CategoryProductsList({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<CategoryProductsList> createState() => _CategoryProductsListState();
}

class _CategoryProductsListState extends State<CategoryProductsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<CategoryProductsCubit>().getCategoryProducts(
      isInitialLoad: true,
      categoryId: widget.categoryId,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CategoryProductsCubit>().getCategoryProducts(
        isInitialLoad: false,
        categoryId: widget.categoryId,
      );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: widget.categoryName,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<
        CategoryProductsCubit,
        CategoryProductsState<CategoryProductsModel>
      >(
        builder: (context, state) {
          return state.when(
            idle:
                () => Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    'لا توجد منتجات متاحة حالياً.',
                    style: AppFonts.font18GreenBold,
                  ),
                ),
            loading: () => const Center(child: CustomProgressIndicator()),
            loadingMore: (data) {
              final products = data.data?.data ?? [];
              if (products.isEmpty) {
                return Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    'لا توجد منتجات متاحة حالياً.',
                    style: AppFonts.font18GreenBold,
                  ),
                );
              }
              return _buildProductGrid(
                products: products,
                cubit: context.read<CategoryProductsCubit>(),
                isLoadingMore: true,
              );
            },
            success: (data) {
              final products = data.data?.data ?? [];
              if (products.isEmpty) {
                return Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    'لا توجد منتجات متاحة حالياً.',
                    style: AppFonts.font18GreenBold,
                  ),
                );
              }
              return _buildProductGrid(
                products: products,
                cubit: context.read<CategoryProductsCubit>(),
                isLoadingMore: false,
              );
            },
            error: (error) => Center(child: Text(error.toString())),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid({
    required List<ProductData> products,
    required CategoryProductsCubit cubit,
    required bool isLoadingMore,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getCategoryProducts(
          isInitialLoad: true,
          categoryId: widget.categoryId,
        );
      },
      child: GridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(
          left: 18.r,
          right: 18.r,
          top: 10.r,
          bottom: 24.r,
        ),
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

          return CategoryProductsCard(
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
