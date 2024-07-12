import 'package:get/get.dart';

class MedicineReminderController extends GetxController {
  //TODO: Implement MedicineReminderController

  List reminders = [
    {
      "medicine": "test",
      "description": "test desc",
      "type": "monthly",
      "interval": 2,
      "total": 10,
      "time": DateTime.now(),
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
