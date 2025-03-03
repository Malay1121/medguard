import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'all_imports.dart';

GetStorage getStorage = GetStorage();

Map apiKeys = {
  "gemini": "AIzaSyBp73DKyzF2KwK2yPNc5lYzO_hkdcgJxyk",
};

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String generateFromMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

bool validateEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validatePassword(String password) {
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
      .hasMatch(password);
}

bool isEmptyString(String? string) {
  if (string == null || string.isEmpty) {
    return true;
  }
  return false;
}

void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..userInteractions = false
    ..dismissOnTap = false;
}

Future<Map<String, dynamic>> fetchPost() async {
  Map<String, dynamic>? userDetails = readUserDetails();
  Map symptoms = await DatabaseHelper.getSymptoms();
  Map disease = await DatabaseHelper.getDisease();
  Map body = {
    "symptoms": symptoms["symptoms"],
    "diseases": disease["diseases"],
    "age": userDetails!["age"],
    "weight": userDetails["weight"],
    "height": userDetails["height"],
    "gender": userDetails["gender"],
  };
  String bodyEncoded = json.encode({
    "system_instruction": {
      "parts": [
        {
          "text": AppStrings.systemPromptPost,
        }
      ]
    },
    "contents": [
      {
        "parts": [
          {
            "text":
                "Generate a post that will help elderly people related to health. Few data of the user: " +
                    json.encode(body),
          }
        ]
      }
    ],
  });
  // print(bodyEncoded);
  var headers = {'Content-Type': 'application/json'};
  var request = await http.post(
    Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=${apiKeys["gemini"]}'),
    headers: headers,
    body: bodyEncoded,
  );

  if (request.statusCode == 200) {
    String response = request.body;
    return json.decode(response);
  } else {
    // print(request.statusCode);
    return {};
  }
}

Future<Map<String, dynamic>> fetchSymptoms(String text) async {
  String bodyEncoded = json.encode({
    "system_instruction": {
      "parts": [
        {
          "text": AppStrings.systemPromptFindSymptoms,
        }
      ]
    },
    "contents": [
      {
        "parts": [
          {
            "text": text,
          }
        ]
      }
    ],
    "generationConfig": {"response_mime_type": "application/json"}
  });
  // print(bodyEncoded);
  var headers = {'Content-Type': 'application/json'};
  var request = await http.post(
    Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=${apiKeys["gemini"]}'),
    headers: headers,
    body: bodyEncoded,
  );

  if (request.statusCode == 200) {
    String response = request.body;
    return json.decode(response);
  } else {
    // print(request.statusCode);
    return {};
  }
}

Future<Map<String, dynamic>> fetchDiseases() async {
  Map<String, dynamic>? userDetails = readUserDetails();
  Map symptoms = await DatabaseHelper.getSymptoms();
  Map body = {
    "age": userDetails!["age"],
    "weight": userDetails["weight"],
    "height": userDetails["height"],
    "gender": userDetails["gender"],
    "symptoms": symptoms["symptoms"],
  };
  String bodyEncoded = json.encode({
    "system_instruction": {
      "parts": [
        {
          "text": AppStrings.systemPrompt,
        }
      ]
    },
    "contents": [
      {
        "parts": [
          {
            "text": json.encode(body),
          }
        ]
      }
    ],
    "generationConfig": {"response_mime_type": "application/json"}
  });
  // print(bodyEncoded);
  var headers = {'Content-Type': 'application/json'};
  var request = await http.post(
    Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=${apiKeys["gemini"]}'),
    headers: headers,
    body: bodyEncoded,
  );

  if (request.statusCode == 200) {
    String response = request.body;
    return json.decode(response);
  } else {
    // print(request.statusCode);
    return {};
  }
}

void writeUserDetails(Map<String, dynamic> data) {
  // print(data);
  getStorage.write("userDetails", data);
  // print(readUserDetails());
}

Map<String, dynamic>? readUserDetails() {
  return getStorage.read("userDetails");
}

Future textToSpeech(String text) async {
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.ambient,
      [
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
        IosTextToSpeechAudioCategoryOptions.mixWithOthers
      ],
      IosTextToSpeechAudioMode.voicePrompt);
  await flutterTts.awaitSpeakCompletion(true);
  await flutterTts.speak(text);
}

void editUserDetails(Map<String, dynamic> data) {
  Map userDetails = getStorage.read("userDetails");
  for (var key in data.keys) {
    if (userDetails[key] == null) {
      userDetails.addEntries({key: data[key]}.entries);
    } else {
      userDetails[key] = data[key];
    }
  }
  getStorage.write("userDetails", data);
}

void showFirebaseError(error) {
  showSnackbar(message: error);
}

String formatDate(DateTime date) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  return dateFormat.format(date);
}

String formatTime(Time time) {
  if (time.hour >= 12) {
    return "${time.hour - 12}:${time.minute} PM";
  } else {
    return "${time.hour}:${time.minute} AM";
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return showSnackbar(title: 'Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return showSnackbar(title: 'Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return showSnackbar(
        title:
            'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

void showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          width: 341.w(context),
          height: 424.h(context),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(48),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32.h(context),
              ),
              Container(
                width: 131.w(context),
                height: 131.h(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkRed,
                ),
                child: Center(
                  child: Icon(
                    Icons.priority_high,
                    color: AppColors.white,
                    size: 51.t(context),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h(context),
              ),
              AppText(
                text: AppStrings.needHelp,
                textAlign: TextAlign.center,
                style: h1(
                  context: context,
                  color: AppColors.midnightBlue,
                ),
              ),
              SizedBox(
                height: 8.h(context),
              ),
              AppText(
                text: AppStrings.activateSOS,
                textAlign: TextAlign.center,
                width: 252.w(context),
                style: bodySRegular(context: context, color: AppColors.grey500),
              ),
              SizedBox(
                height: 32.h(context),
              ),
              CommonButton(
                text: AppStrings.getHelp,
                width: 245.w(context),
                onTap: () {},
              ),
              SizedBox(
                height: 16.h(context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppText(
                  text: AppStrings.close,
                  textAlign: TextAlign.center,
                  style:
                      bodySRegular(context: context, color: AppColors.grey500),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

String getMessageFromErrorCode(e) {
  // print(e.code);
  // print(e.message);
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
      break;
    case "channel-error":
      return "Unable to establish connection on channel. Please try again later";
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return "Server error, please try again later.";
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";
      break;
    default:
      return "Login failed. Please try again.";
      break;
  }
}

run(VoidCallback task) async {
  try {
    task();
  } catch (e, stack) {
    await FirebaseCrashlytics.instance.recordError(e, stack,
        reason: task.toString(),
        information: [ModalRoute.of(Get.context!)?.settings.name ?? '']);

    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Oops!'),
        backgroundColor: AppColors.white,
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(
                color: AppColors.deepTeal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showSnackbar({String? title, String? message}) {
  Get.snackbar(title ?? 'medguard', message ?? '');
}

// showSnackbar({required String message, ContentType? type}) {
//   final snackBar = SnackBar(
//     /// need to set following properties for best effect of awesome_snackbar_content
//     elevation: 0,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.transparent,
//     content: AwesomeSnackbarContent(
//       title: type == ContentType.success ? 'Yay!' : 'On Snap!',
//       message: message,
//
//       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//       contentType: type ?? ContentType.success,
//     ),
//   );
//
//   snackbarKey.currentState
//     ?..hideCurrentSnackBar()
//     ..showSnackBar(snackBar);
// }
