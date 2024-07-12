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
              onPressed: () {},
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
                                  text: reminder["medicine"],
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
                              text: reminder["time"].toString(),
                              // width: 67.w(context),
                              style: bodySMedium(
                                context: context,
                                color: AppColors.grey600,
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
