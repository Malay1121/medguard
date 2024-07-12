import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../helper/all_imports.dart';
import '../controllers/add_medication_controller.dart';

class AddMedicationView extends GetView<AddMedicationController> {
  const AddMedicationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMedicationController>(
        init: AddMedicationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: AppText(
                text: AppStrings.addMedication,
                style: h1(
                  context: context,
                  color: AppColors.grey700,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
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
                    Center(
                      child: AppText(
                        text: AppStrings.weAreHereToRemindYou,
                        style: bodySRegular(
                          context: context,
                          color: AppColors.grey500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.medicineName,
                      // controller: controller.emailController,
                      keyboardType: TextInputType.text,
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
                      hintText: AppStrings.description,
                      height: null,
                      // controller: controller.passwordController,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: AppStrings.startDate,
                              // height: 21.h(context),
                              style: h3(
                                context: context,
                                color: AppColors.midnightBlue,
                              ),
                            ),
                            SizedBox(
                              height: 10.h(context),
                            ),
                            InkWell(
                              onTap: () {
                                DatePickerDialog(
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 365),
                                  ),
                                );
                              },
                              child: Container(
                                width: 159.w(context),
                                decoration: BoxDecoration(
                                  color: AppColors.grey50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h(context),
                                    horizontal: 10.w(context),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      text: formatDate(controller.startDate),
                                      centered: true,
                                      height: 21.h(context),
                                      style: bodySSemiBold(
                                        context: context,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: AppStrings.endDate,
                              // height: 21.h(context),
                              style: h3(
                                context: context,
                                color: AppColors.midnightBlue,
                              ),
                            ),
                            SizedBox(
                              height: 10.h(context),
                            ),
                            InkWell(
                              onTap: () {
                                DatePickerDialog(
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 365),
                                  ),
                                );
                              },
                              child: Container(
                                width: 159.w(context),
                                decoration: BoxDecoration(
                                  color: AppColors.grey50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h(context),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      text: formatDate(controller.endDate),
                                      centered: true,
                                      height: 21.h(context),
                                      style: bodySSemiBold(
                                        context: context,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    AppText(
                      text: AppStrings.whichDays,
                      // height: 21.h(context),
                      style: h3(
                        context: context,
                        color: AppColors.midnightBlue,
                      ),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var weekday in controller.weekDays.keys)
                          GestureDetector(
                            onTap: () => controller.toggleWeekday(weekday),
                            child: Container(
                              width: 41.w(context),
                              height: 41.h(context),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.containsWeekday(weekday)
                                    ? AppColors.midnightBlue
                                    : AppColors.grey50,
                              ),
                              child: Center(
                                child: AppText(
                                  text: controller.weekDays[weekday]["day"]
                                      .toString()
                                      .substring(0, 2),
                                  style: bodySRegular(
                                    context: context,
                                    color: controller.containsWeekday(weekday)
                                        ? AppColors.white
                                        : AppColors.grey500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    AppText(
                      text: AppStrings.whatTime,
                      // height: 21.h(context),
                      style: h3(
                        context: context,
                        color: AppColors.midnightBlue,
                      ),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    for (var time in controller.timings)
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: AppText(
                                  text: formatTime(time),
                                  centered: true,
                                  height: 21.h(context),
                                  style: bodySSemiBold(
                                    context: context,
                                    color: AppColors.grey500,
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  controller.timings.remove(time);
                                  controller.update();
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.darkRed,
                                  size: 24.t(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.addTime,
                      onTap: () => controller.addTiming(),
                      backgroundColor: AppColors.grey50,
                      textColor: AppColors.grey500,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.createAccount,
                      width: 342.w(context),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
