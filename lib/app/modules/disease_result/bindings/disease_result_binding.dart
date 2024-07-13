import 'package:get/get.dart';

import '../controllers/disease_result_controller.dart';

class DiseaseResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseResultController>(
      () => DiseaseResultController(),
    );
  }
}
