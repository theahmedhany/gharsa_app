import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/all_categories/all_categories_model.dart';
import '../../manager/all_categories/all_categories_cubit.dart';
import '../../manager/all_categories/all_categories_state.dart';
import '../widgets/custom_categories_list_tile.dart';
import 'dart:math';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<String> categoriesImage = [
    'assets/icons/Category_4.svg',
    'assets/icons/Category_3.svg',
    'assets/icons/Category_1.svg',
    'assets/icons/Category_2.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'جميع الأقسام',
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<
        AllCategoriesCubit,
        AllCategoriesState<List<AllCategoriesModel>>
      >(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: state.when(
              idle: () => const Center(child: CustomProgressIndicator()),
              loading: () => const Center(child: CustomProgressIndicator()),
              success: (data) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 14.r),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    String imageSrc = getImageForCategory(index);
                    return CustomCategoriesListTile(
                      title: data[index].name ?? '',
                      imageSrc: imageSrc,
                      press: () {
                        context.pushNamed(
                          Routes.categoryProductsList,
                          arguments: {
                            'categoryId': data[index].id,
                            'categoryName': data[index].name,
                          },
                        );
                      },
                    );
                  },
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
            ),
          );
        },
      ),
    );
  }

  String getImageForCategory(int index) {
    if (index < categoriesImage.length) {
      return categoriesImage[index];
    } else {
      return categoriesImage[Random().nextInt(categoriesImage.length)];
    }
  }
}
