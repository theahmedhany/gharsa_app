import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/best_seller_products_card.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'الأكثر مبيعاً',
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(
          left: 18.r,
          right: 18.r,
          top: 10.r,
          bottom: 24.r,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: 10,
        itemBuilder: (_, index) {
          return const BestSellerProductsCard();
        },
      ),
    );
  }
}
