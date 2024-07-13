import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

class MedicineReminderController extends GetxController {
  //TODO: Implement MedicineReminderController

  List reminders = [
    // {
    //   "name": "test",
    //   "description": "test desc",
    //   "type": "monthly",
    //   "interval": 2,
    //   "total": 10,
    //   "timings": [DateTime.now()],
    // },
  ];

  void getMedicationReminders() async {
    reminders = await DatabaseHelper.getMedications();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMedicationReminders();
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
