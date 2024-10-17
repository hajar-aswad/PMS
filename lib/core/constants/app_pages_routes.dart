
// ignore_for_file: void_checks

import 'package:get/get.dart';
import 'package:pms/controller/screen/auth_controller.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/controller/screen/main_controller.dart';
import 'package:pms/view/login_screen/LogInScreen.dart';
import 'package:pms/view/main_screen/main_screen.dart';



abstract class AppPagesRoutes{
  // Auth
  static const String onBoarding = "/onBoarding";
  static const String loginScreen = "/";
  static const String mainScreen = "/mainScreen";

  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(
            () {
              Get.put(AuthController());
            },
      ),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: BindingsBuilder(
            () {
              Get.put(MainController());
              Get.put(DashboardScreenController());
            },
      ),
      transition: Transition.fadeIn,
    ),
  ];
}