import 'package:get/get.dart';

import '../modules/add_medication/bindings/add_medication_binding.dart';
import '../modules/add_medication/views/add_medication_view.dart';
import '../modules/disease_result/bindings/disease_result_binding.dart';
import '../modules/disease_result/views/disease_result_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/medicine_reminder/bindings/medicine_reminder_binding.dart';
import '../modules/medicine_reminder/views/medicine_reminder_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/select_symptoms/bindings/select_symptoms_binding.dart';
import '../modules/select_symptoms/views/select_symptoms_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_SYMPTOMS,
      page: () => const SelectSymptomsView(),
      binding: SelectSymptomsBinding(),
    ),
    GetPage(
      name: _Paths.MEDICINE_REMINDER,
      page: () => const MedicineReminderView(),
      binding: MedicineReminderBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEDICATION,
      page: () => const AddMedicationView(),
      binding: AddMedicationBinding(),
    ),
    GetPage(
      name: _Paths.DISEASE_RESULT,
      page: () => const DiseaseResultView(),
      binding: DiseaseResultBinding(),
    ),
  ];
}
