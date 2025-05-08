import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.press,
    required this.buttonTitle,
    required this.buttonColor,
    required this.boarderColor,
    required this.textColor,
  });

  final VoidCallback press;
  final String buttonTitle;
  final Color buttonColor;
  final Color boarderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 12.r),
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: boarderColor, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
