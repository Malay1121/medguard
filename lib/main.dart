import 'package:flutter/material.dart';
import 'package:flutter_responsive_helper/flutter_responsive_helper.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  initializeSize(390, 844);
  runApp(
    GetMaterialApp(
      title: "MedGuard",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
