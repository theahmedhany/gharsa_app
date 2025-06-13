import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import 'custom_category_icon.dart';

class MainCategories extends StatelessWidget {
  const MainCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCategoryIcon(
          press: () {
            context.pushNamed(
              Routes.categoryProductsList,
              arguments: {'categoryId': 8, 'categoryName': 'حبوب'},
            );
          },
          icon: 'assets/icons/Category_1.svg',
          title: 'حبوب',
        ),
        CustomCategoryIcon(
          press: () {
            context.pushNamed(
              Routes.categoryProductsList,
              arguments: {'categoryId': 9, 'categoryName': 'بقوليات'},
            );
          },
          icon: 'assets/icons/Category_2.svg',
          title: 'بقوليات',
        ),
        CustomCategoryIcon(
          press: () {
            context.pushNamed(
              Routes.categoryProductsList,
              arguments: {'categoryId': 7, 'categoryName': 'خضروات'},
            );
          },
          icon: 'assets/icons/Category_3.svg',
          title: 'خضروات',
        ),
        CustomCategoryIcon(
          press: () {
            context.pushNamed(
              Routes.categoryProductsList,
              arguments: {'categoryId': 4, 'categoryName': 'فواكهه'},
            );
          },
          icon: 'assets/icons/Category_4.svg',
          title: 'فواكهه',
        ),
      ],
    );
  }
}
