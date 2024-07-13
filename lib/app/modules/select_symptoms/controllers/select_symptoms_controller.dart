import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

class SelectSymptomsController extends GetxController {
  //TODO: Implement SelectSymptomsController

  Map<String, dynamic> symptoms = {
    "a": [],
    "b": [],
    "c": [],
    "d": [],
    "e": [],
    "f": [],
    "g": [],
    "h": [],
    "i": [],
    "j": [],
    "k": [],
    "l": [],
    "m": [],
    "n": [],
    "o": [],
    "p": [],
    "q": [],
    "r": [],
    "s": [],
    "t": [],
    "u": [],
    "v": [],
    "w": [],
    "x": [],
    "y": [],
    "z": [],
  };

  List selectedSymptoms = [];

  void toggleSymptom(Map<String, dynamic> symptom) {
    if (symptomSelected(symptom)) {
      selectedSymptoms.remove(symptom);
    } else {
      selectedSymptoms.add(symptom);
    }
    update();
  }

  bool symptomSelected(Map symptom) {
    return (selectedSymptoms
            .firstWhereOrNull((sy) => symptom["id"] == sy["id"]) !=
        null);
  }

  void getSymptoms() async {
    Map<String, dynamic>? data = (await FirebaseFirestore.instance
            .collection("symptoms")
            .doc("symptoms")
            .get())
        .data();
    if (data != null) {
      symptoms = data;
      update();
    }
  }

  void getSelectedSymptoms() async {
    if (await DatabaseHelper.symptomsExists()) {
      selectedSymptoms =
          (await DatabaseHelper.getSymptoms())["symptoms"]?.toList();
      update();
    }
  }

  void confirm() async {
    EasyLoading.show();
    if (await DatabaseHelper.symptomsExists()) {
      await DatabaseHelper.updateSymptoms(data: {"symptoms": selectedSymptoms});
    } else {
      await DatabaseHelper.createSymptoms(data: {"symptoms": selectedSymptoms});
    }

    if (await DatabaseHelper.diseaseExists()) {
      Map apiResult = await fetchDiseases();
      Map<String, dynamic> data =
          jsonDecode(apiResult["candidates"][0]["content"]["parts"][0]["text"]);
      await DatabaseHelper.createDisease(data: data);
    } else {
      await DatabaseHelper.createDisease(data: await fetchDiseases());
    }
    EasyLoading.dismiss();
    Get.toNamed(
      Routes.DISEASE_RESULT,
      arguments: selectedSymptoms,
    );
  }

  @override
  void onInit() {
    super.onInit();
    getSymptoms();
  }

  @override
  void onReady() {
    super.onReady();
    getSelectedSymptoms();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
