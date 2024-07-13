import 'package:day_night_time_picker/day_night_time_picker.dart';

import '../../../helper/all_imports.dart';
import '../controllers/medicine_reminder_controller.dart';

class MedicineReminderView extends GetView<MedicineReminderController> {
  const MedicineReminderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineReminderController>(
        init: MedicineReminderController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: AppText(
                text: AppStrings.medicationReminder,
                style: h1(
                  context: context,
                  color: AppColors.grey700,
                ),
              ),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.midnightBlue,
              onPressed: () async {
                Get.toNamed(Routes.ADD_MEDICATION);
              },
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 34.h(context),
                    // ),
                    // AppText(
                    //   text: AppStrings.today,
                    //   style: bodyLg(
                    //     context: context,
                    //     color: AppColors.grey500,
                    //   ),
                    // ),
                    if (controller.reminders.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 350.h(context)),
                          child: AppText(
                            text: "Press + to add a medicine",
                            style:
                                h3(context: context, color: AppColors.grey600),
                          ),
                        ),
                      ),
                    for (var reminder in controller.reminders)
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24.h(context),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: reminder["name"],
                                  style: h3(
                                    context: context,
                                    color: AppColors.midnightBlue,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h(context),
                                ),
                                AppText(
                                  text: reminder["description"],
                                  style: bodySRegular(
                                    context: context,
                                    color: AppColors.grey500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            AppText(
                              text: formatTime(Time(
                                      hour:
                                          (reminder["timings"][0] as Timestamp)
                                              .toDate()
                                              .hour,
                                      minute:
                                          (reminder["timings"][0] as Timestamp)
                                              .toDate()
                                              .minute))
                                  .toString(),
                              // width: 67.w(context),
                              style: bodySMedium(
                                context: context,
                                color: AppColors.grey600,
                              ),
                            ),
                            SizedBox(
                              width: 16.w(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                DatabaseHelper.deleteMedication(data: reminder);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: AppColors.deepPink,
                                size: 22.t(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
