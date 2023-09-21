import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_tasks/common/common_function.dart/padding.dart';
import 'package:job_tasks/common/common_widget/CustomButton.dart';
import 'package:job_tasks/common/common_widget/CustomTextField.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/contants/app_images.dart';
import 'package:job_tasks/feature/auth/controller/auth_controller.dart';
import 'package:job_tasks/feature/auth/login/login_screen.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool termsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                padding100,
                Image.asset(AppImages.logo, width: 55.w, height: 55.h),
                padding75,
                CustomTextField(
                  validatorFn: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  showLabel: false,
                  trailingIconPath: AppImages.tick,
                  trailIconColor: Colors.transparent,
                  texfieldHeight: 54.h,
                  controller: emailController,
                  hintText: 'Email',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: false,
                  label: '',
                  subTitle: '',
                ),
                padding20,
                CustomTextField(
                  validatorFn: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  showLabel: false,
                  trailingIconPath: AppImages.visible,
                  trailIconColor: AppColors.lightGrey,
                  texfieldHeight: 54.h,
                  controller: passwordController,
                  hintText: 'Password',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: true,
                  label: '',
                  subTitle: '',
                ),
                padding20,
                CustomTextField(
                  validatorFn: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your confirm password';
                    }
                    return null;
                  },
                  showLabel: false,
                  trailingIconPath: AppImages.visible,
                  trailIconColor: AppColors.lightGrey,
                  texfieldHeight: 54.h,
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: true,
                  label: '',
                  subTitle: '',
                ),
                padding24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: getMediumStyle(
                          color: AppColors.blackColor,
                          fontSize: MyFonts.size14),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: getMediumStyle(
                            color: AppColors.appMainColor,
                            fontSize: MyFonts.size14),
                      ),
                    ),
                  ],
                ),
                padding100,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I agree to',
                      style: getMediumStyle(
                          color: AppColors.appMainColor,
                          fontSize: MyFonts.size14),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.appMainColor,
                          fontSize: MyFonts.size14),
                    ),
                    padding10,
                    InkWell(
                        onTap: () {
                          setState(() {
                            termsAndConditions = !termsAndConditions;
                          });
                        },
                        child: Container(
                          height: 14.h,
                          width: 14.h,
                          decoration: BoxDecoration(
                            color: termsAndConditions
                                ? AppColors.appMainColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.appMainColor),
                          ),
                          child: Icon(Icons.check,
                              size: 10.sp,
                              color: termsAndConditions
                                  ? Colors.white
                                  : Colors.transparent),
                        )),
                  ],
                ),
                padding10,
                CustomButton(
                  isLoading: AuthController.authInstance.isLoading.value,
                  onPressed: () {
                     AuthController.authInstance.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                  },
                  buttonText: 'Login',
                  buttonHeight: 47.h,
                  borderRadius: 10.r,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
