import 'package:flutter/material.dart';
import 'package:flutter_tests/controller/news_controller/news_controller.dart';
import 'package:flutter_tests/ui/dashboard_screen/components/breaking_news.dart';
import 'package:flutter_tests/widgets/custom_loading.dart';
import 'package:get/get.dart';

class DashboardBody extends StatelessWidget {
  DashboardBody({Key? key}) : super(key: key);

  final newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => newsController.isLoading.value
              ? CustomLoading.customLoading()
              : ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    _heading('Breaking News'),
                    BreakingNewsSection(articles: newsController.fetchedData.value.articles,)
                  ],
                ),
        ),
      ),
    );
  }

  _heading(String heading) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
