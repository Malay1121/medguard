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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h(context),
                          ),
                          AppText(
                            text: AppStrings.autofillSymptoms,
                            maxLines: null,
                            width: 250.w(context),
                            style: bodySSemiBold(
                              context: context,
                              color: AppColors.midnightBlue,
                            ),
                          ),
                          SizedBox(
                            height: 10.h(context),
                          ),
                          Container(
                            width: 342.w(context),
                            decoration: BoxDecoration(
                              color: AppColors.grey50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h(context),
                                horizontal: 10.w(context),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 270.w(context),
                                    child: Wrap(
                                      runSpacing: 10.h(context),
                                      spacing: 10.w(context),
                                      children: [
                                        if (controller.selectedSymptoms
                                            .where(
                                              (e) => e["custom"] == true,
                                            )
                                            .isEmpty)
                                          AppText(
                                            text: AppStrings.recordSymptoms,
                                            maxLines: null,
                                            width: 250.w(context),
                                            style: bodySSemiBold(
                                              context: context,
                                              color: AppColors.grey400,
                                            ),
                                          ),
                                        for (var symptom in controller
                                            .selectedSymptoms
                                            .where(
                                          (e) => e["custom"] == true,
                                        ))
                                          GestureDetector(
                                            onTap: () => controller
                                                .toggleSymptom(symptom),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    controller.symptomSelected(
                                                            symptom)
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
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (!controller.listening) {
                                        try {
                                          await controller.getText();
                                        } catch (e) {
                                          controller.listening = false;
                                          controller.update();
                                          EasyLoading.dismiss();
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 50.h(context),
                                      width: 50.w(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.midnightBlue,
                                      ),
                                      child: Icon(
                                        controller.listening
                                            ? Icons.stop
                                            : Icons.mic,
                                        size: 24.t(context),
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          for (var alphabet in controller.symptoms.keys)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 32.h(context),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // print(controller.selectedSymptoms);
                                      controller.update();
                                    },
                                    child: AppText(
                                      text: alphabet.toUpperCase(),
                                      style: h1(
                                        context: context,
                                        color: AppColors.midnightBlue,
                                      ),
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
                                        GestureDetector(
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
                      onTap: () => controller.confirm(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
