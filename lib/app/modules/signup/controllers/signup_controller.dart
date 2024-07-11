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
      print("hi");
      print(validation());

      EasyLoading.show();
      Map<String, dynamic>? userDetails = {
        "name": nameController.text,
        "email": emailController.text,
        "password": generateMd5(passwordController.text),
      };
      userDetails = await DatabaseHelper.loginUser(data: userDetails);
      if (userDetails != null) {
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
