import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../best_seller/manager/best_seller_products_cubit.dart';
import '../../../best_seller/manager/best_seller_products_state.dart';
import 'custom_products_card.dart';
import 'shimmer_custom_product_card.dart';

class HomeProductsGrid extends StatelessWidget {
  const HomeProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerProductsCubit, BestSellerProductsState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox(),
          loading: () => const Center(child: ShimmerCustomProductCard()),
          loadingMore: (products) {
            final productList = products.data?.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.only(bottom: 26.r),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: 2,
              itemBuilder: (_, index) {
                return CustomProductsCard(product: productList[index]);
              },
            );
          },
          error: (error) => Center(child: Text(error.toString())),
          success: (products) {
            final productList = products.data?.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.only(bottom: 26.r),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: 2,
              itemBuilder: (_, index) {
                return CustomProductsCard(product: productList[index]);
              },
            );
          },
        );
      },
    );
  }
}
