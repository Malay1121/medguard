import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';
import 'package:medguard/app/helper/constants.dart';

import '../controllers/select_symptoms_controller.dart';

class SelectSymptomsView extends GetView<SelectSymptomsController> {
  const SelectSymptomsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectSymptomsController>(
        init: SelectSymptomsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: AppText(
                text: AppStrings.selectSymptoms,
                style: h1(
                  context: context,
                  color: AppColors.grey700,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w(context),
                      ),
                      child: Column(
                        children: [
                          for (var alphabet in controller.symptoms.keys)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 32.h(context),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppText(
                                    text: alphabet.toUpperCase(),
                                    style: h1(
                                      context: context,
                                      color: AppColors.midnightBlue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h(context),
                                  ),
                                  Wrap(
                                    spacing: 10.w(context),
                                    runSpacing: 16.h(context),
                                    children: [
                                      for (var symptom
                                          in controller.symptoms[alphabet])
                                        InkWell(
                                          onTap: () =>
                                              controller.toggleSymptom(symptom),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: controller
                                                      .symptomSelected(symptom)
                                                  ? AppColors.midnightBlue
                                                  : AppColors.grey50,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10.h(context),
                                                horizontal: 10.w(context),
                                              ),
                                              child: AppText(
                                                text: symptom["name"],
                                                height: 21.h(context),
                                                style: bodySSemiBold(
                                                  context: context,
                                                  color: controller
                                                          .symptomSelected(
                                                              symptom)
                                                      ? AppColors.white
                                                      : AppColors.grey500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFF6F6F6),
                        offset: Offset(0, 1),
                        spreadRadius: 2,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                  child: Center(
                    child: CommonButton(
                      text: AppStrings.confirm,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
