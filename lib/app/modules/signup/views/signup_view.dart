import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 83.h(context),
                    ),
                    Image.asset(
                      AppImages.logo,
                      height: 107.h(context),
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      height: 32.h(context),
                    ),
                    AppText(
                      text: controller.signup
                          ? AppStrings.createAccount
                          : AppStrings.hiWelcomeBack,
                      style: h1(
                        context: context,
                        color: AppColors.midnightBlue,
                      ),
                      width: 342.w(context),
                      height: 30.h(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h(context),
                    ),
                    AppText(
                      text: controller.signup
                          ? AppStrings.weAreHereToHelpYou
                          : AppStrings.hopeYoureDoingFine,
                      style: bodySRegular(
                        context: context,
                        color: AppColors.grey500,
                      ),
                      width: 342.w(context),
                      height: 21.h(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 32.h(context),
                    ),
                    if (controller.signup)
                      CommonTextField(
                        hintText: AppStrings.yourName,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 13.5.h(context),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.user,
                            width: 18.w(context),
                            height: 18.h(context),
                          ),
                        ),
                      ),
                    if (controller.signup)
                      SizedBox(
                        height: 20.h(context),
                      ),
                    CommonTextField(
                      hintText: AppStrings.yourEmail,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 13.5.h(context),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.email,
                          width: 18.w(context),
                          height: 18.h(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.password,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 13.5.h(context),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.lock,
                          width: 18.w(context),
                          height: 18.h(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonButton(
                      text: controller.signup
                          ? AppStrings.createAccount
                          : AppStrings.signIn,
                      onTap: () => controller.submit(),
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 139.w(context),
                          height: 1,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w(context),
                          ),
                          child: AppText(
                            text: "or",
                            width: 16.w(context),
                            style: bodySMedium(
                              context: context,
                              color: AppColors.grey500,
                            ),
                          ),
                        ),
                        Container(
                          width: 139.w(context),
                          height: 1,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text:
                              "${controller.signup ? AppStrings.doYouHaveAnAccount : AppStrings.dontHaveAnAccountYet} ",
                          style: bodySRegular(
                            context: context,
                            color: AppColors.grey500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.switchScreen(),
                          child: AppText(
                            text: controller.signup
                                ? AppStrings.signIn
                                : AppStrings.signUp,
                            style: bodySRegular(
                              context: context,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
