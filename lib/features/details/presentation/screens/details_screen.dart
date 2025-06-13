import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/product_details_cubit.dart';
import '../../manager/product_details_state.dart';
import '../widgets/product_details_content.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/main_loading_indicator.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'تفاصيل المنتج',
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            idle: () {
              return const Center(child: MainLoadingIndicator());
            },
            loading: () {
              return const Center(child: MainLoadingIndicator());
            },
            success: (productDetails) {
              return SingleChildScrollView(
                child: ProductDetailsContent(details: productDetails),
              );
            },
            error: (errorMsg) {
              return Center(
                child: Text(
                  errorMsg.toString(),
                  style: TextStyle(
                    color: AppColors.kMainGreyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
