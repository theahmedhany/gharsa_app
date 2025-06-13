import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/new_order_cubit.dart';
import '../../manager/new_order_state.dart';
import 'new_order_alert_dialog.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/main_loading_indicator.dart';

class NewOrderBlocListener extends StatelessWidget {
  const NewOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewOrderCubit, NewOrderState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (newOrderResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          error: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => CustomAlertDialog(
            dialogColor: Colors.redAccent,
            dialogHeader: 'حدث خطأ ما خلال إنشاء الطلب',
            dialogBody: error,
            dialogIcon: Icons.error,
            press: () => context.pop(),
          ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.kMainPrimaryColor.withValues(alpha: 0.3),
      builder: (context) => const Center(child: MainLoadingIndicator()),
    );
  }

  void showSuccessDialog(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => NewOrderAlertDialog(
            dialogColor: AppColors.kMainPrimaryColor,
            dialogHeader: 'تم إنشاء طلبك بنجاح.',
            dialogBody:
                'تهانينا! تم إنشاء الطلب بنجاح ، سنقوم بمعالجته في أقرب وقت ممكن ، والتواصل معك لتأكيد الطلب.',
            dialogIcon: Icons.check_circle_rounded,
            press: () {
              context.pop();
            },
          ),
    );
  }
}
