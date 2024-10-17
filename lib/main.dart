import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/core/constants/app_pages_routes.dart';
import 'package:pms/core/constants/app_themes.dart';
import 'package:pms/core/service/intial_bindings.dart';
import 'package:pms/core/service/storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageServices().init());
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Name',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      theme: AppThemes.themeEnglish,
      getPages: AppPagesRoutes.appPages,
      initialRoute: "/",
    );
  }
}
