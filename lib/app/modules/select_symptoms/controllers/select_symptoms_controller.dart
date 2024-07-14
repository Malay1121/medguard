import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
    EasyLoading.show();

    if (symptomSelected(symptom)) {
      selectedSymptoms.removeWhere((sy) =>
          symptom["name"] == sy["name"] ||
          ((symptom["id"] != null || sy["id"] != null) &&
              symptom["id"] == sy["id"]));
    } else {
      selectedSymptoms.add(symptom);
    }
    update();
    EasyLoading.dismiss();
  }

  bool symptomSelected(Map symptom) {
    return (selectedSymptoms.firstWhereOrNull((sy) =>
            symptom["name"] == sy["name"] || symptom["id"] == sy["id"]) !=
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

  void speak() {
    if (!listening) {
      getText();
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
    Get.offAndToNamed(
      Routes.DISEASE_RESULT,
    );
  }

  bool listening = false;
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;

  void initializeSpeech() async {
    speechEnabled = await speechToText.initialize(onError: (errorNotification) {
      listening = false;
      update();
      EasyLoading.dismiss();
    }, onStatus: (status) {
      if (status == "done") {}
    });
  }

  Future<String> getText() async {
    String result = "";
    listening = true;
    update();

    SpeechRecognitionResult r = await speechToText.listen(
        listenOptions: SpeechListenOptions(listenMode: ListenMode.dictation),
        partialResults: false,
        onResult: (res) {
          result = res.recognizedWords;
          listening = false;
          update();
          getSymptomsFromText(result);
        });

    return result;
  }

  Future getSymptomsFromText(String text) async {
    EasyLoading.show();
    print(text);
    Map apiResult = await fetchSymptoms(text);
    Map<String, dynamic> data =
        jsonDecode(apiResult["candidates"][0]["content"]["parts"][0]["text"]);
    selectedSymptoms.addAll(data["symptoms"]);
    update();
    EasyLoading.dismiss();
  }

  @override
  void onInit() {
    super.onInit();
    initializeSpeech();
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
