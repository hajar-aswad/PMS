// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pms/core/constants/app_api_routes.dart';
import 'package:pms/core/constants/app_enums.dart';
import 'package:pms/core/constants/app_pages_routes.dart';
import 'package:pms/core/constants/app_keys.dart';
import 'package:pms/core/service/storage_services.dart';
import 'package:pms/core/utils/widgets_utils.dart';
import 'package:pms/core/utils/logic_utils.dart';

class ApiService extends GetxService {
  String token = '';

  @override
  void onInit() {
    token =
        StorageServices.sharedPreferences.getString(AppKeys.rememberToken) ??
            '';
    super.onInit();
  }

  Future<Either<StatusView, Map>> post(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      var response = await http
          .post(Uri.http(AppApiRoute.server, url), body: body, headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == StatusCodeRequest.ok ||
          response.statusCode == StatusCodeRequest.badRequest) {
        return Right(jsonDecode(response.body));
      } else if (response.statusCode == StatusCodeRequest.unauthorised) {
        WidgetsUtils.showSnackBar(
            title: 'unauthorised', message: 'you Must Login To App');
        StorageServices.sharedPreferences
            .setBool(AppKeys.isAuthenticated, false);
        Get.offNamed(AppPagesRoutes.loginScreen);
      } else {
        LogicUtils.log('post Server Problem ${response.statusCode} ');
        WidgetsUtils.showSnackBar(
            title: "post Server Problem ", message: "please Try Later");
      }
    } catch (e) {
      LogicUtils.log('post ApiService unKnownException: $e');
      WidgetsUtils.showSnackBar(
          title: "post ApiService unKnownException: ",
          message: "please Try Later");
    }
    return const Left(StatusView.serverFailure);
  }

  Future<Either<StatusView, Map>> get({required String url}) async {
    try {
      var response =
          await http.get(Uri.http(AppApiRoute.server, url), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == StatusCodeRequest.ok ||
          response.statusCode == StatusCodeRequest.badRequest) {
        return Right(jsonDecode(response.body));
      } else if (response.statusCode == StatusCodeRequest.unauthorised) {
        WidgetsUtils.showSnackBar(
            title: "unauthorised", message: "you Must Login To App");
        StorageServices.sharedPreferences
            .setBool(AppKeys.isAuthenticated, false);
        Get.offNamed(AppPagesRoutes.loginScreen);
      } else {
        LogicUtils.log('post Server Problem ${response.statusCode}');
        WidgetsUtils.showSnackBar(
            title: 'post Server Problem ', message: 'please Try Later');
      }
    } catch (e) {
      LogicUtils.log('post ApiService unKnownException: $e');
      WidgetsUtils.showSnackBar(
          title: 'Unknown Problem ', message: 'please Try Later');
    }
    return const Left(StatusView.serverFailure);
  }

  static Future<bool> sendRequest(
      {required Future Function() request,
      Future Function(dynamic response)? onSuccess,
      Future Function(StatusView statusView, ValidationMessage message)?
          onFailure}) async {
    var response = await request.call();
    if (response is! StatusView) {
      if (response is! ValidationMessage) {
        if (onSuccess != null) {
          await onSuccess.call(response);
          return true;
        }
      } else {
        if (onFailure != null) {
          await onFailure.call(StatusView.none, response);
        }
      }
    } else {
      if (onFailure != null) {
        await onFailure.call(response, ValidationMessage(''));
      }
    }
    return false;
  }
}

class ValidationMessage {
  String text;

  ValidationMessage(this.text);
}
