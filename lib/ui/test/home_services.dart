import 'package:flutter/cupertino.dart';
import 'package:flutter_tests/ui/test/home_model.dart';
import 'package:flutter_tests/utilities/internet_check.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  static Future<HomeModel?> getHomeData() async {
    var homeModel = HomeModel();
    if (await Utilities.isInternetWorking()) {
      try {
        var response = await http.get(Uri.parse('https://maahuri.com/api'));
        if (response.statusCode == 200 || response.statusCode == 201) {
          homeModel = homeModelFromJson(response.body);
        } else {
          homeModel = homeModelFromJson(response.body);
        }
        return homeModel;
      } catch (e) {
        debugPrint('there you go');
      }
    } else {
      Get.snackbar('Message', 'No Internet');
    }
  }
}
