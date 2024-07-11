import 'package:medguard/app/helper/all_imports.dart';

void main() async {
  initializeSize(390, 844);
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAS9AReAwz9pMcmAwC-XRM4qwYZP4L_6ss",
          appId: "1:666379745133:android:092da0d53e1c685f128c64",
          messagingSenderId: "666379745133",
          projectId: "medguard-app"));
  runApp(
    GetMaterialApp(
      title: "MedGuard",
      builder: EasyLoading.init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
