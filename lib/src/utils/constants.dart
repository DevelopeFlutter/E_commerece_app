import 'package:flutter/foundation.dart';

const printLogTag = "[YOORI-Flutter]";
const printLogEnable = true;

printLog(dynamic data) {
  if (printLogEnable) {
    if (kDebugMode) {
      print("$printLogTag${data.toString()}");
    }
  }
}
