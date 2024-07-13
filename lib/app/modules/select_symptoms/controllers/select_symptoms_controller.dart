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

  void toggleSymptom(Map symptom) {
    if (symptomSelected(symptom)) {
      selectedSymptoms.remove(symptom);
    } else {
      selectedSymptoms.add(symptom);
    }
    update();
  }

  bool symptomSelected(Map symptom) {
    return selectedSymptoms.contains(symptom);
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

  void confirm() {
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
  }

  @override
  void onClose() {
    super.onClose();
  }
}
