import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../manager/new_order_cubit.dart';
import '../widgets/new_order_bloc_listener.dart';
import '../widgets/new_order_text_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  });

  final String productName, productImage;
  final double productPrice;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'تأكيد الطلب',
        backgroundColor: AppColors.kMainSecondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<NewOrderCubit>().formKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kMainPrimaryColor.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.kMainGreyColor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: productImage,
                            width: 150.r,
                            height: 100.r,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return const Center(
                                child: CustomProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Image.asset(
                                  'assets/master/splash_screen.png',
                                  width: 100.w,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      horizontalSpace(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.font18DarkBold,
                            ),
                            verticalSpace(10),
                            Text(
                              '${productPrice.toString()} جنيه.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.font16GreyRegular,
                            ),
                            verticalSpace(10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  Text(
                    textDirection: TextDirection.rtl,
                    'اسم المشتري.',
                    style: AppFonts.font16GreyBold,
                  ),
                  verticalSpace(8),
                  NewOrderTextField(
                    hintText: 'من فضلك أدخل اسمك بالكامل.',
                    controller:
                        context.read<NewOrderCubit>().clientNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل اسمك بالكامل.';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(16),
                  Text('رقم تليفون المشتري.', style: AppFonts.font16GreyBold),
                  verticalSpace(8),
                  NewOrderTextField(
                    hintText: 'من فضلك أدخل رقم تليفونك.',
                    controller:
                        context.read<NewOrderCubit>().clientPhoneController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final trimmedValue = value?.trim() ?? '';
                      if (trimmedValue.isEmpty ||
                          !AppRegex.isPhoneNumberValid(trimmedValue)) {
                        return 'من فضلك أدخل رقم التليفون.';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(16),
                  Text('عنوان المشتري.', style: AppFonts.font16GreyBold),
                  verticalSpace(8),
                  NewOrderTextField(
                    hintText: 'من فضلك أدخل عنوانك بالكامل.',
                    controller: context.read<NewOrderCubit>().addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل عنوانك بالكامل.';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(16),
                  Text('الكمية', style: AppFonts.font16GreyBold),
                  verticalSpace(8),
                  NewOrderTextField(
                    hintText: 'من فضلك أدخل الكمية المطلوبة.',
                    controller:
                        context.read<NewOrderCubit>().quantityController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || value == '0') {
                        return 'من فضلك أدخل الكمية المطلوبة.';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(40),
                  AppButton(
                    press: () {
                      final formKey = context.read<NewOrderCubit>().formKey;
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<NewOrderCubit>().emitNewOrder(productId);
                      }
                    },
                    buttonTitle: 'تأكيد الطلب',
                    buttonColor: AppColors.kMainPrimaryColor,
                    boarderColor: AppColors.kMainPrimaryColor,
                    textColor: Colors.white,
                  ),
                  verticalSpace(30),
                  const NewOrderBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
