import 'package:get/get.dart';

import '../controllers/add_medication_controller.dart';

class AddMedicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMedicationController>(
      () => AddMedicationController(),
    );
  }
}
