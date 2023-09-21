import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? hintColor;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final Widget? tailingIcon;
  final String? leadingIconPath;
  final Color? trailIconColor;
  final String? trailingIconPath;
  final double? texfieldHeight;
  final String label;
  final bool showLabel;
  final int? maxLines;
  final String subTitle;
  final Function()? subTitleOnTap;
  final Function()? onTap;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.onChanged,
      required this.onFieldSubmitted,
      this.inputType,
      this.leadingIcon,
      required this.obscure,
      this.validatorFn,
      this.hintColor,
      this.icon,
      this.tailingIcon,
      this.leadingIconPath,
      this.texfieldHeight,
      required this.label,
      this.showLabel = true,
      this.trailingIconPath,
      this.maxLines,
      required this.subTitle,
      this.onTap,
      this.trailIconColor,
      this.subTitleOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: validatorFn,
      obscureText: obscure,
      controller: controller,
      keyboardType: inputType,
      style:
          getMediumStyle(fontSize: MyFonts.size16, color: AppColors.blackColor),
      decoration: InputDecoration(
        contentPadding: trailingIconPath != null
            ? EdgeInsets.only(top: 15, left: 20.w)
            : EdgeInsets.symmetric(horizontal: 20.w),
        prefixIcon: leadingIconPath != null
            ? Padding(
                padding: EdgeInsets.all(13.0.h),
                child: Image.asset(
                  leadingIconPath!,
                  width: 15.w,
                  height: 15.h,
                ),
              )
            : null,
        errorStyle: getRegularStyle(
            fontSize: MyFonts.size10,
            color: Theme.of(context).colorScheme.error),
        suffixIcon: trailingIconPath != null
            ? Padding(
                padding: EdgeInsets.all(13.h),
                child: Image.asset(
                  trailingIconPath!,
                  width: 20.w,
                  height: 20.h,
                  color: trailIconColor,
                ),
              )
            : null,
        labelStyle: getMediumStyle(
          fontSize: MyFonts.size14,
          color: AppColors.enableBorder,
        ),
        labelText: hintText,
        hintText: hintText,
        hintStyle: getLightStyle(
            fontSize: MyFonts.size16, color: hintColor ?? AppColors.lightGrey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.enableBorder),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
