import 'package:background_fetch/background_fetch.dart';
import 'package:medguard/app/helper/all_imports.dart';

class SignupController extends CommonController {
  //TODO: Implement SignupController

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool signup = true;

  void switchScreen() {
    signup = !signup;
    update();
  }

  void submit() {
    if (signup) {
      signUp();
    } else {
      logIn();
    }
  }

  void signUp() async {
    if (validation()) {
      EasyLoading.show();

      Map<String, dynamic> userDetails = {
        "name": nameController.text,
        "email": emailController.text,
        "password": generateMd5(passwordController.text),
      };
      await DatabaseHelper.createUser(data: userDetails);
      Get.offAllNamed(Routes.HOME);
      EasyLoading.dismiss();
    }
  }

  void logIn() async {
    if (validation()) {
      EasyLoading.show();
      Map<String, dynamic>? userDetails = {
        "name": nameController.text,
        "email": emailController.text,
        "password": generateMd5(passwordController.text),
      };
      UserCredential? result =
          await DatabaseHelper.loginUser(data: userDetails);
      if (result != null) {
        Get.offAllNamed(Routes.HOME);
      }
      EasyLoading.dismiss();
    }
  }

  bool validation() {
    if (signup && nameController.text.isEmpty) {
      showSnackbar(message: AppStrings.nameValidation);
      return false;
    } else if (emailController.text.isEmpty ||
        !validateEmail(emailController.text)) {
      showSnackbar(message: AppStrings.emailValidation);
      return false;
    } else if (passwordController.text.isEmpty ||
        !validatePassword(passwordController.text)) {
      showSnackbar(message: AppStrings.passwordValidation);
      return false;
    }
    return true;
  }

  // bool _enabled = true;
  // int _status = 0;
  // List<DateTime> _events = [];
  //
  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //   int status = await BackgroundFetch.configure(
  //       BackgroundFetchConfig(
  //           minimumFetchInterval: 1,
  //           stopOnTerminate: false,
  //           enableHeadless: true,
  //           requiresBatteryNotLow: false,
  //           requiresCharging: false,
  //           requiresStorageNotLow: false,
  //           requiresDeviceIdle: false,
  //           requiredNetworkType: NetworkType.NONE), (String taskId) async {
  //     // <-- Event handler
  //     // This is the fetch-event callback.
  //     print("[BackgroundFetch] Event received $taskId");
  //     const AndroidNotificationDetails androidNotificationDetails =
  //         AndroidNotificationDetails('your channel id', 'your channel name',
  //             channelDescription: 'your channel description',
  //             importance: Importance.max,
  //             priority: Priority.high,
  //             ticker: 'ticker');
  //     const NotificationDetails notificationDetails =
  //         NotificationDetails(android: androidNotificationDetails);
  //     await flutterLocalNotificationsPlugin.show(
  //         0, 'plain title', 'plain body', notificationDetails,
  //         payload: 'item x');
  //
  //     update();
  //     // IMPORTANT:  You must signal completion of your task or the OS can punish your app
  //     // for taking too long in the background.
  //     BackgroundFetch.finish(taskId);
  //   }, (String taskId) async {
  //     // <-- Task timeout handler.
  //     // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
  //     print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
  //     BackgroundFetch.finish(taskId);
  //   });
  //   print('[BackgroundFetch] configure success: $status');
  //   _status = status;
  //   update();
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!isClosed) return;
  // }
  //
  // void _onClickEnable(enabled) {
  //   _enabled = enabled;
  //   update();
  //   if (enabled) {
  //     BackgroundFetch.start().then((int status) {
  //       print('[BackgroundFetch] start success: $status');
  //     }).catchError((e) {
  //       print('[BackgroundFetch] start FAILURE: $e');
  //     });
  //   } else {
  //     BackgroundFetch.stop().then((int status) {
  //       print('[BackgroundFetch] stop success: $status');
  //     });
  //   }
  // }
  //
  // void _onClickStatus() async {
  //   int status = await BackgroundFetch.status;
  //   print('[BackgroundFetch] status: $status');
  //   _status = status;
  //   update();
  // }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      signup = Get.arguments["signup"];
      update();
    }
    // initPlatformState();
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
