import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/search_product_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ابدأ البحث'),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
              cursorColor: AppColors.kMainPrimaryColor,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 18,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.kMainGreyColor,
                    width: 1.5.r,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.kMainPrimaryColor,
                    width: 1.5.r,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.kMainGreyColor,
                    width: 1.5.r,
                  ),
                ),

                hintStyle: TextStyle(
                  color: AppColors.kMainGreyColor,
                  fontSize: 16.sp,
                ),
                hintText: 'ابحث عن منتج',
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.r),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.kMainGreyColor,
                  ),
                ),
                prefixIconColor: Colors.black,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 45.r,
                  minHeight: 20.r,
                  maxHeight: 20.r,
                  maxWidth: 45.r,
                ),
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10.r, bottom: 20.r),
              itemBuilder: (context, index) {
                return const SearchProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
