import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  int currentPage = 0;
  List<Map> pages = [
    {
      "image": AppImages.onboard1,
      "title": AppStrings.symptomTracker,
      "description": AppStrings.symptomTrackerDesc
    },
    {
      "image": AppImages.onboard2,
      "title": AppStrings.appointmentReminders,
      "description": AppStrings.appointmentRemindersDesc
    },
    {
      "image": AppImages.onboard3,
      "title": AppStrings.healthTips,
      "description": AppStrings.healthTipsDesc
    }
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      changePage(currentPage + 1);
    }
  }

  void changePage(int page) {
    currentPage = page;
    update();
  }

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
