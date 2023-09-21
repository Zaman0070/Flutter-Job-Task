import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_tasks/common/common_function.dart/padding.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class SocialButtonCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const SocialButtonCard(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 45.h,
        width: 150.w,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGrey.withOpacity(0.4),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.02),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 18.17.h,
              width: 18.17.w,
            ),
            padding10,
            Text(
              text,
              style: getMediumStyle(
                color: AppColors.blackColor,
                fontSize: MyFonts.size16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
