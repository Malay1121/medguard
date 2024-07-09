import 'package:flutter/material.dart';
import 'package:flutter_responsive_helper/flutter_responsive_helper.dart';

import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.white,
              body: Column(
                children: [
                  Image.asset(
                    controller.pages[controller.currentPage]["image"],
                    width: 390.w(context),
                    height: 532.h(context),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 28.5.h(context),
                  ),
                  AppText(
                    text: controller.pages[controller.currentPage]["title"],
                    height: 27.h(context),
                    width: 311.w(context),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    centered: true,
                    style: h2(
                      context: context,
                      color: AppColors.grey700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h(context),
                  ),
                  AppText(
                    text: controller.pages[controller.currentPage]
                        ["description"],
                    height: 63.h(context),
                    width: 311.w(context),
                    maxLines: null,
                    centered: true,
                    textAlign: TextAlign.center,
                    style: bodySRegular(
                      context: context,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    height: 24.h(context),
                  ),
                  CommonButton(
                    text: AppStrings.next,
                    onTap: () => controller.nextPage(),
                  ),
                  SizedBox(
                    height: 28.5.h(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i <= 2; i++)
                        GestureDetector(
                          onTap: () => controller.changePage(i),
                          child: Container(
                            width: i == controller.currentPage
                                ? 30.w(context)
                                : 8.w(context),
                            height: 8.h(context),
                            margin: EdgeInsets.symmetric(
                              horizontal: 3.w(context),
                            ),
                            decoration: BoxDecoration(
                              shape: i == controller.currentPage
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              borderRadius: i == controller.currentPage
                                  ? BorderRadius.circular(40)
                                  : null,
                              color: i == controller.currentPage
                                  ? AppColors.midnightBlue
                                  : AppColors.grey400,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h(context),
                  ),
                  AppText(
                    text: AppStrings.skip,
                    height: 21.h(context),
                    textAlign: TextAlign.center,
                    centered: true,
                    style: bodySRegular(
                      context: context,
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ));
        });
  }
}
