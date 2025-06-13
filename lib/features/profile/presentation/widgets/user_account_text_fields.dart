import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import 'user_data_field.dart';

class UserAccountTextFields extends StatelessWidget {
  final String name;
  final String email;

  const UserAccountTextFields({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        children: [
          UserDataField(hintText: 'الإسم بالكامل', title: name),
          verticalSpace(30),
          UserDataField(hintText: 'الإيميل', title: email),
          verticalSpace(58),
        ],
      ),
    );
  }
}
