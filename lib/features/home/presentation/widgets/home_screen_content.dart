import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_products_grid.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import 'custom_home_app_bar.dart';
import 'home_main_panner.dart';
import 'main_categories.dart';
import 'main_category_row.dart';
import 'main_search_section.dart';

class HomeScreenContent extends StatelessWidget {
  HomeScreenContent({
    super.key,
    required this.scaffoldKey,
    required this.onSearchPressed,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onSearchPressed;

  final List<String> weatherImages = [
    'assets/icons/weather_1.svg',
    'assets/icons/weather_2.svg',
    'assets/icons/weather_3.svg',
    'assets/icons/weather_4.svg',
    'assets/icons/weather_5.svg',
  ];

  String get randomWeatherImage {
    final random = Random();
    return weatherImages[random.nextInt(weatherImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEE d MMMM').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
          child: Column(
            children: [
              CustomHomeAppBar(
                randomWeatherImage: randomWeatherImage,
                formattedDate: formattedDate,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(20),
                      const HomeMainPanner(),
                      verticalSpace(30),
                      MainSearchSection(
                        scaffoldKey: scaffoldKey,
                        onSearchPressed: onSearchPressed,
                      ),
                      verticalSpace(30),
                      MainCategoryRow(
                        title: 'الأقسام',
                        press: () {
                          context.pushNamed(Routes.categoryScreen);
                        },
                      ),
                      verticalSpace(20),
                      const MainCategories(),
                      verticalSpace(30),
                      MainCategoryRow(
                        title: 'الأكثر مبيعاً',
                        press: () {
                          context.pushNamed(Routes.bestSellerScreen);
                        },
                      ),
                      verticalSpace(20),
                      const HomeProductsGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
