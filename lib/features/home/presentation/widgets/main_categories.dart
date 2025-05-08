import 'package:flutter/material.dart';
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
          press: () {},
          icon: 'assets/icons/Category_1.svg',
          title: 'حبوب',
        ),
        CustomCategoryIcon(
          press: () {},
          icon: 'assets/icons/Category_2.svg',
          title: 'بقوليات',
        ),
        CustomCategoryIcon(
          press: () {},
          icon: 'assets/icons/Category_3.svg',
          title: 'خضروات',
        ),
        CustomCategoryIcon(
          press: () {},
          icon: 'assets/icons/Category_4.svg',
          title: 'فواكهه',
        ),
      ],
    );
  }
}
