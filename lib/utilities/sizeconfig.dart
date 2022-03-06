import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static double height() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double width() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
