import 'package:get/get.dart';
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

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      signup = Get.arguments["signup"];
      update();
    }
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
