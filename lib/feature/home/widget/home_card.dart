import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_tasks/common/common_function.dart/padding.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/feature/home/data/data.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class HomeCard extends StatelessWidget {
  final Person person;
  const HomeCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 1.sw,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              person.imageURL,
              height: 100.h,
              width: 125.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.name,
                style: getSemiBoldStyle(color: AppColors.blackColor),
              ),
              padding6,
              Text(
                person.city,
                style: getSemiBoldStyle(color: AppColors.lightGrey),
              ),
              padding6,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: person.price,
                    style: getSemiBoldStyle(color: AppColors.blackColor)),
                TextSpan(
                    text: ' hour',
                    style: getSemiBoldStyle(color: AppColors.lightGrey))
              ])),
              padding18,
              Row(
                children: [
                  Text('Dispobile Adesso',
                      style: getSemiBoldStyle(
                          color: AppColors.appMainColor,
                          fontSize: MyFonts.size14)),
                  SizedBox(
                    width: 12.w,
                  ),
                  CircleAvatar(
                      radius: 7.r,
                      backgroundColor: AppColors.appMainColor.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 4.r,
                        backgroundColor: AppColors.appMainColor,
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
