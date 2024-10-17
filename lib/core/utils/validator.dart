
import  'package:get/get.dart';

abstract class Validator {
  static const String none='';
  static const String phone='phone';
  static const String email='email';
  static const String num='num';
  static const String negativeNum='negativeNum';
  static const String positiveNum='positiveNum';

  static String? valid(String val, {String type=none,double minLength=1,double maxLength=20,double minVal=0,double maxVal=double.infinity}) {
    if (val.isEmpty) {
      return "Can 'not be empty";
    }
    if(type == phone && !GetUtils.isPhoneNumber(val)) {
      return 'phone Number Not Valid';
    }
    if(type == email && !GetUtils.isEmail(val)) {
      return "email Number Not Valid";
    }
    if(type == positiveNum) {
      if (!GetUtils.isNum(val)) {
        return "number Not Valid";
      }
      if (double.parse(val) <= 0) {
        return "number Not Be Negative";
      }
      if(double.parse(val) < minVal){
        return "number Not Be Smaller $minVal";
      }
      if(double.parse(val) > maxVal) {
        return "number Not Be Greater $maxVal";
      }
    }
    if(val.length < minLength) {
      return "number Not Be Smaller  $minLength letters";
    }
    if(val.length > maxLength) {
      return "number Not Be Greater  $maxLength letters";
    }
    return null;
  }
}
