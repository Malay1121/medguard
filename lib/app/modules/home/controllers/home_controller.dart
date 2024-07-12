import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';
import 'package:shake/shake.dart';

class HomeController extends CommonController {
  //TODO: Implement HomeController

  List<Map> tools = [
    {
      "title": AppStrings.symptoms,
      "image": AppImages.symptomsTab,
      "page": Routes.SELECT_SYMPTOMS,
    },
    {
      "title": AppStrings.medicineReminder,
      "image": AppImages.medicationReminderTab,
      "page": Routes.MEDICINE_REMINDER,
    },
    {
      "title": AppStrings.doctorAppointmentReminder,
      "image": AppImages.appointmentReminderTab,
      "page": Routes.HOME,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      showHelpDialog(Get.context!);
    });
    detector.startListening();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
