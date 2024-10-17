import 'package:pms/core/constants/app_api_routes.dart';
import 'package:pms/core/service/api_service.dart';
import 'package:pms/core/utils/logic_utils.dart';

import '../../data/models/admin.dart';

class AuthApiController {
  ApiService apiService;

  AuthApiController(this.apiService);

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    LogicUtils.log('Start login() Api');
    var response = await apiService.post(url: AppApiRoute.login, body: {
      'email': email.toString(),
      'password': password.toString(),
    });
    LogicUtils.log('End login() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return Admin.fromJson(map['data']);
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> logout() async {
    LogicUtils.log('Start logout() Api');
    var response = await apiService.get(url: AppApiRoute.logout);
    LogicUtils.log('End logout() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }
}
