// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:core';
import 'package:logger/logger.dart';

class LogicUtils {
  static void log(Object? note) {
    Logger().i(note);
  }

  static String upperFirstChar(String string) {
    if (string.isNotEmpty) {
      return string.replaceFirst(string[0], string[0].toUpperCase());
    }
    return string;
  }

  static getJson(
      {required Map map, required String key, dynamic defaultVal = ''}) {
    if (map.containsKey(key) && map[key] != null) {
      if (defaultVal is double) {
        return double.parse(map[key].toString());
      }
      return map[key];
    }
    return defaultVal;
  }

  static getNestedVale(
      {required Map map,
      required String firstKey,
      required String secondKey,
      required dynamic defaultVal}) {
    if (map.containsKey(firstKey) && map[firstKey] != null) {
      if (map[firstKey].containsKey(secondKey)) {
        return map[firstKey][secondKey];
      }
    }
    return defaultVal;
  }
}
