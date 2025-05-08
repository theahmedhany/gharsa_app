import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa_app/features/profile/presentation/widgets/user_account_text_fields.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  Future<Map<String, String>> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    return {'name': name, 'email': email};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'الحساب الخاص بي',
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, String>>(
            future: _loadUserData(),
            builder: (context, snapshot) {
              final name = snapshot.data?['name'] ?? 'Unknown Name';
              final email = snapshot.data?['email'] ?? 'Unknown Name';
              return Column(
                children: [
                  verticalSpace(30),
                  Container(
                    width: 140.r,
                    height: 140.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.kMainPrimaryColor,
                        width: 10,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.kMainSecondaryColor,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    name.split(' ')[0],
                    textAlign: TextAlign.center,
                    style: AppFonts.font18DarkBold,
                  ),
                  verticalSpace(50),
                  UserAccountTextFields(name: name, email: email),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
