// import 'dart:async';
// import 'dart:isolate';
// import 'dart:ui';
//
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:background_fetch/background_fetch.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:medguard/app/helper/all_imports.dart';
//
// // @pragma('vm:entry-point')
// // void backgroundFetchHeadlessTask(HeadlessTask task) async {
// //   String taskId = task.taskId;
// //   bool isTimeout = task.timeout;
// //   if (isTimeout) {
// //     BackgroundFetch.finish(taskId);
// //     return;
// //   }
// //   BackgroundFetch.finish(taskId);
// //   return;
// // }
//
// @pragma('vm:entry-point')
// void printHello() {
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }
//
// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//
//   return true;
// }
//
// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   service.on("stop").listen((event) {
//     service.stopSelf();
//     print("background process is now stopped");
//   });
//
//   service.on("start").listen((event) {});
//
//   Timer.periodic(const Duration(seconds: 1), (timer) {
//     print("service is successfully running ${DateTime.now().second}");
//   });
// }
