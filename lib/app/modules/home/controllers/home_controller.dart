import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';
import 'package:shake/shake.dart';

class HomeController extends CommonController {
  //TODO: Implement HomeController

  List<Map> tools = [
    {
      "title": AppStrings.symptoms,
      "image": AppImages.symptomsTab,
      "page": Routes.DISEASE_RESULT,
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

  String post = "";

  void generatePost() async {
    Map<String, dynamic> apiResult = await fetchPost();
    post = apiResult["candidates"][0]["content"]["parts"][0]["text"];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    generatePost();
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
