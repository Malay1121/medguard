import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

class HomeController extends CommonController {
  //TODO: Implement HomeController

  List<Map> tools = [
    {
      "title": AppStrings.symptoms,
      "image": AppImages.symptomsTab,
      "page": Routes.HOME,
    },
    {
      "title": AppStrings.medicineReminder,
      "image": AppImages.medicationReminderTab,
      "page": Routes.HOME,
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
