import 'package:get/get.dart';

import '../../../helper/all_imports.dart';

class DiseaseResultController extends GetxController {
  //TODO: Implement DiseaseResultController

  Map diseases = {
    "diseases": [
      {
        "name": "Diseases name",
        "description": "About the disease",
        "what_to_do": "What can be done to prevent/cure it",
        "chance": 0.2342,
        "show_doctor": 0.43
      }
    ],
  };

  Widget progressBar(BuildContext context, double progress, bool doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text:
              "${doctor ? AppStrings.showDoctor : AppStrings.chances}${(progress * 100).floor()}%",
          style: h4(
            context: context,
            color: AppColors.grey600,
          ),
        ),
        SizedBox(
          height: 4.h(context),
        ),
        Row(
          children: [
            Container(
              width: (322 * progress).toDouble().w(context),
              height: 4.h(context),
              decoration: BoxDecoration(
                color: AppColors.grey600,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),
            Container(
              width: (322 * (1 - progress)).toDouble().w(context),
              height: 4.h(context),
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void init() async {
    EasyLoading.show();
    if (await DatabaseHelper.diseaseExists()) {
      diseases = await DatabaseHelper.getDisease();
      update();
    } else {
      Get.offAndToNamed(Routes.SELECT_SYMPTOMS);
    }
    EasyLoading.dismiss();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
