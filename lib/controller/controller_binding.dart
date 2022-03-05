import 'package:flutter_tests/controller/news_controller/news_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    //--------------------------------------------------------------------------controller
    Get.put(NewsController(), permanent: false);
  }
}
