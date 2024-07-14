import 'package:medguard/app/helper/all_imports.dart';

void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
  await Get.toNamed(Routes.ONBOARDING);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
  onDidReceiveLocalNotification: (id, title, body, payload) {
    print(id.toString() +
        " " +
        title.toString() +
        "" +
        body.toString() +
        "" +
        payload.toString());
  },
);
final InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsDarwin,
);
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  initializeSize(390, 844);
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.grey50,
      ),
      alignment: Alignment.center,
      child: AppText(
        text: 'Error!\n${details.exception}',
        style: TextStyle(color: AppColors.grey600),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  };
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAS9AReAwz9pMcmAwC-XRM4qwYZP4L_6ss",
          appId: "1:666379745133:android:092da0d53e1c685f128c64",
          messagingSenderId: "666379745133",
          projectId: "medguard-app"));
  configureEasyLoading();

  runApp(
    GetMaterialApp(
      title: "MedGuard",
      builder: EasyLoading.init(),
      showSemanticsDebugger: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
