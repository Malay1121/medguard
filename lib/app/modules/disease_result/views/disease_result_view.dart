import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../helper/all_imports.dart';
import '../controllers/disease_result_controller.dart';

class DiseaseResultView extends GetView<DiseaseResultController> {
  const DiseaseResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiseaseResultController>(
        init: DiseaseResultController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: AppText(
                text: AppStrings.diseasesResult,
                style: h1(
                  context: context,
                  color: AppColors.grey700,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 16.h(context),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAndToNamed(Routes.SELECT_SYMPTOMS),
                      child: AppText(
                        text: AppStrings.editSymptoms,
                        style: h3(
                          context: context,
                          color: AppColors.grey600,
                        ),
                      ),
                    ),
                    for (Map disease in controller.diseases["diseases"])
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h(context),
                        ),
                        child: Container(
                          width: 342.w(context),
                          decoration: BoxDecoration(
                            color: AppColors.grey50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h(context),
                            horizontal: 10.w(context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: disease["name"],
                                style: h1(
                                  context: context,
                                  color: AppColors.midnightBlue,
                                ),
                              ),
                              SizedBox(
                                height: 16.h(context),
                              ),
                              controller.progressBar(
                                context,
                                disease["chance"].toDouble(),
                                false,
                              ),
                              SizedBox(
                                height: 10.h(context),
                              ),
                              controller.progressBar(
                                context,
                                disease["show_doctor"].toDouble(),
                                true,
                              ),
                              SizedBox(
                                height: 16.h(context),
                              ),
                              AppText(
                                text: disease["description"],
                                // height: 21.h(context),
                                maxLines: null,
                                style: bodySSemiBold(
                                  context: context,
                                  color: AppColors.grey500,
                                ),
                              ),
                              SizedBox(
                                height: 16.h(context),
                              ),
                              AppText(
                                text: disease["what_to_do"],
                                // height: 21.h(context),
                                maxLines: null,
                                style: bodySSemiBold(
                                  context: context,
                                  color: AppColors.grey500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 16.h(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
