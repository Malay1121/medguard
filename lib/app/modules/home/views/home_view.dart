import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../helper/all_imports.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
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
                  AppText(
                    text: AppStrings.options,
                    style: h3(
                      context: context,
                      color: AppColors.midnightBlue,
                    ),
                  ),
                  SizedBox(
                    height: 16.h(context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (Map tool in controller.tools)
                        GestureDetector(
                          onTap: () => Get.toNamed(tool["page"]),
                          // onTap: () async {
                          // Get.toNamed(Routes.SELECT_SYMPTOMS);
                          // final int helloAlarmID = 0;
                          // await AndroidAlarmManager.oneShot(
                          //     const Duration(minutes: 1),
                          //     helloAlarmID,
                          //     printHello);
                          // print(readUserDetails());
                          // const AndroidNotificationDetails
                          //     androidNotificationDetails =
                          //     AndroidNotificationDetails(
                          //         'repeating channel id',
                          //         'repeating channel name',
                          //         channelDescription:
                          //             'repeating description');
                          // const NotificationDetails notificationDetails =
                          //     NotificationDetails(
                          //         android: androidNotificationDetails);
                          // await flutterLocalNotificationsPlugin
                          //     .periodicallyShow(
                          //         0,
                          //         'repeating title',
                          //         'repeating body',
                          //         RepeatInterval.everyMinute,
                          //         notificationDetails,
                          //         androidAllowWhileIdle: true);
                          // },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                tool["image"],
                                width: 62.w(context),
                                height: 62.h(context),
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 4.h(context),
                              ),
                              AppText(
                                text: tool["title"],
                                width: 100.w(context),
                                textAlign: TextAlign.center,
                                maxLines: null,
                                style: bodyXSBold(
                                  context: context,
                                  color: AppColors.grey600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h(context),
                  ),
                  HtmlWidget(
                    controller.post,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
