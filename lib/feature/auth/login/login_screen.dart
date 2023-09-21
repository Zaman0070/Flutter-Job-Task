import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:job_tasks/common/common_function.dart/padding.dart';
import 'package:job_tasks/common/common_widget/CustomButton.dart';
import 'package:job_tasks/common/common_widget/CustomTextField.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/contants/app_images.dart';
import 'package:job_tasks/feature/auth/controller/auth_controller.dart';
import 'package:job_tasks/feature/auth/register/register_screen.dart';
import 'package:job_tasks/feature/auth/widget/social_button.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController());

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
                padding24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButtonCard(
                        image: AppImages.apple, text: 'Apple', onTap: () {}),
                    SocialButtonCard(
                        image: AppImages.google,
                        text: 'Apple',
                        onTap: () async {
                          await authController.signInWithGoogle();
                        }),
                  ],
                ),
                padding24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: getMediumStyle(
                          color: AppColors.blackColor,
                          fontSize: MyFonts.size14),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const RegistScreen());
                      },
                      child: Text(
                        'Register',
                        style: getMediumStyle(
                            color: AppColors.appMainColor,
                            fontSize: MyFonts.size14),
                      ),
                    ),
                  ],
                ),
                padding120,
                Obx(() {
                  return CustomButton(
                    isLoading: authController.isLoading.value,
                    onPressed: () {
                      AuthController.authInstance.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    buttonText: 'Login',
                    buttonHeight: 47.h,
                    borderRadius: 10.r,
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
