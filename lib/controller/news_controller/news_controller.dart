import 'package:flutter/foundation.dart';
import 'package:flutter_tests/models/news_model.dart';
import 'package:flutter_tests/services/news_services.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var fetchedData = NewsModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    try {
      isLoading.value = true;
      var data = await NewsServices.getNews();
      if (data != null) {
        isLoading.value = false;
        data.fold((data) => fetchedData.value = data,
            (error) => debugPrint('the error is $error'));
      }
    } on Exception catch (e) {
      debugPrint('there is an exception $e');
    }
  }
}
