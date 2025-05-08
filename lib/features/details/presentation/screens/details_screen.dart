import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa_app/core/helpers/extensions.dart';
import 'package:gharsa_app/core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.r, bottom: 20.r),
              child: Image.asset(
                'assets/images/image_2.png',
                width: double.infinity,
                height: 300.h,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 500.h),
              decoration: BoxDecoration(
                color: AppColors.kMainSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            '45 جنيه',
                            style: AppFonts.font16DarkBold.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        Flexible(
                          child: Text(
                            maxLines: 2,
                            textDirection: TextDirection.rtl,
                            'سلة خضروات متنوعة',
                            style: AppFonts.font22GreenBold.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text(
                      'تضم مجموعة من الخضروات الموسمية الغنية بالعناصر الغذائية، مثل الطماطم، الخيار، الجزر، الفلفل، البطاطس، والبروكلي، لتناسب جميع احتياجات الطهي والسلطات. مثالية لتحضير وجبات صحية ولذيذة، مع ضمان النكهة الطازجة والجودة العالية.',
                      style: AppFonts.font14DarkRegular,
                      textAlign: TextAlign.right,
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.r,
                            vertical: 4.r,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                'Discount 20 EGP',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('اسم المنتج', style: AppFonts.font16DarkBold),
                            horizontalSpace(8),
                            Text(
                              textDirection: TextDirection.rtl,
                              ' القسم:',
                              style: AppFonts.font16GreenBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.r,
                        vertical: 12.r,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                        border: Border.all(
                          color: AppColors.kMainPrimaryColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40.r,
                              height: 40.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.kMainPrimaryColor,
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '90',
                                  maxLines: 1,
                                  textDirection: TextDirection.rtl,
                                  style: AppFonts.font18GreenBold,
                                ),
                              ),
                            ),
                            horizontalSpace(16),
                            Text(
                              'عدد العناصر المتاحة :',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kMainPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('البائع', style: AppFonts.font16DarkBold),
                        horizontalSpace(8),
                        Text(
                          textDirection: TextDirection.rtl,
                          'اسم البائع:',
                          style: AppFonts.font16GreenBold,
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.r,
                            horizontal: 10.r,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite_border_rounded,
                              color: AppColors.kMainGreyColor,
                              size: 20.r,
                            ),
                          ),
                        ),
                        horizontalSpace(18),
                        Expanded(
                          child: AppButton(
                            press: () {
                              context.pushNamed(
                                Routes.newOrderScreen,
                                arguments: {
                                  'productName': 'سلة خضروات متنوعة',
                                  'productImage':
                                      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
                                  'productPrice': 45.0,
                                  'productId': 'Unknown ID',
                                },
                              );
                            },
                            buttonTitle: 'شراء المنتج',
                            buttonColor: AppColors.kMainPrimaryColor,
                            boarderColor: AppColors.kMainPrimaryColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
