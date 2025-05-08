import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa_app/features/category/presentation/widgets/custom_categories_list_tile.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'dart:math';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<String> categoriesImage = [
    'assets/icons/Category_1.svg',
    'assets/icons/Category_2.svg',
    'assets/icons/Category_3.svg',
    'assets/icons/Category_4.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'جميع الأقسام',
        backgroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 14.r),
          itemCount: 4,
          itemBuilder: (context, index) {
            String imageSrc = getImageForCategory(index);
            return CustomCategoriesListTile(
              title: 'خضروات',
              imageSrc: imageSrc,
              press: () {},
            );
          },
        ),
      ),
    );
  }

  String getImageForCategory(int index) {
    if (index < 4) {
      return categoriesImage[index];
    } else {
      return categoriesImage[Random().nextInt(categoriesImage.length)];
    }
  }
}
