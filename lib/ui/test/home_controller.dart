import 'package:flutter/cupertino.dart';
import 'package:flutter_tests/ui/test/home_model.dart';
import 'package:flutter_tests/ui/test/home_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeData = HomeModel().obs;
  var isHomeLoading = false.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    isHomeLoading.value = true;
    var data = await HomeServices.getHomeData();
    if (data != null) {
      isHomeLoading.value = false;
      homeData.value = data;
    } else {
      isHomeLoading.value = false;
      debugPrint('data is worng ');
    }
  }
}
