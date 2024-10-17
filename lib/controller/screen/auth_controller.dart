import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/api/auth_api_controller.dart';
import 'package:pms/core/constants/app_enums.dart';
import 'package:pms/core/constants/app_keys.dart';
import 'package:pms/core/constants/app_pages_routes.dart';
import 'package:pms/core/service/api_service.dart';
import 'package:pms/core/service/storage_services.dart';
import 'package:pms/data/models/admin.dart';

class AuthController extends GetxController {
  AuthApiController authApiController = AuthApiController(Get.find());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StatusView statusView = StatusView.none;
     bool isPasswordVisible = true;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  login() async {
    if (emailController.text.isEmpty) {
      return;
    }
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await authApiController.login(
          email: emailController.text,
          password: passwordController.text,
        );
      },
      onSuccess: (response) async {
        if (response is Admin) {
          StorageServices.sharedPreferences
              .setString(AppKeys.name, response.name!);
          StorageServices.sharedPreferences
              .setString(AppKeys.email, response.email!);
          StorageServices.sharedPreferences
              .setString(AppKeys.photo, response.photo!);
          StorageServices.sharedPreferences
              .setString(AppKeys.rememberToken, response.token!);
          statusView = StatusView.none;
          Get.find<ApiService>().token = response.token!;
          update();
          Get.showSnackbar(const GetSnackBar(
            title: "Success",
            message: "login successfully",
          ));
          Get.toNamed(AppPagesRoutes.mainScreen);
        }
      },
      onFailure: (statusView, message) async {
        this.statusView=statusView;
        Get.showSnackbar(const GetSnackBar(
            title: "Fail",
            message:" your information is  false  ",
          ));
        update();
      },
    );
  }
  
  logout() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await authApiController.logout();
      },
      onSuccess: (response) async {
       Get.offAllNamed(AppPagesRoutes.loginScreen);
      },
      onFailure: (statusView, message) async {
        this.statusView=statusView;
        Get.showSnackbar(const GetSnackBar(
            title: "Fail",
            message:"",
          ));
        update();
      },
    );
  }




}
