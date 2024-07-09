import 'all_imports.dart';

GetStorage getStorage = GetStorage();

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String generateFromMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

bool isEmptyString(String? string) {
  if (string == null || string.isEmpty) {
    return true;
  }
  return false;
}

String getMessageFromErrorCode(e) {
  print(e.code);
  print(e.message);
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
