import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/utils/loading.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color? backColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;
  final double? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 54.h,
      margin: EdgeInsets.symmetric(vertical: padding ?? 10.h),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: backColor ?? AppColors.appMainColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
        ),
        child: SizedBox(
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 56.h,
          child: Center(
              child: isLoading
                  ? LoadingWidget(
                      color: Theme.of(context).colorScheme.onPrimary)
                  : Text(
                      buttonText,
                      style: textStyle ??
                          getMediumStyle(
                              color: textColor ?? Colors.white,
                              fontSize: fontSize ?? MyFonts.size14),
                    )),
        ),
      ),
    );
  }
}
