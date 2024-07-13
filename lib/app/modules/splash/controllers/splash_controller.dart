import 'package:get/get.dart';
import 'package:medguard/app/helper/all_imports.dart';

class SplashController extends CommonController {
  bool firstTime = true;

  void checkLogin() async {
    var userData = readUserDetails();
    print(userData);
    if (userData != null && userData != {}) {
      var user = await DatabaseHelper.loginUser(data: userData);
      print(user);
      if (user != null) {
        firstTime = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkLogin();
    DatabaseHelper.getApis();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAndToNamed(!firstTime ? Routes.HOME : Routes.ONBOARDING);
      },
    );
  }

  @override
  void onReady() {
    print("xD " + readUserDetails().toString());
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
