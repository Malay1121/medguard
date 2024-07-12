import 'package:get/get.dart';

import '../controllers/select_symptoms_controller.dart';

class SelectSymptomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectSymptomsController>(
      () => SelectSymptomsController(),
    );
  }
}
