import 'package:get/get.dart';

import '../controllers/medicine_reminder_controller.dart';

class MedicineReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineReminderController>(
      () => MedicineReminderController(),
    );
  }
}
