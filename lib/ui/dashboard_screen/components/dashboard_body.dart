import 'package:flutter/material.dart';
import 'package:flutter_tests/controller/news_controller/news_controller.dart';
import 'package:flutter_tests/ui/dashboard_screen/components/breaking_news.dart';
import 'package:flutter_tests/utilities/internet_check.dart';
import 'package:flutter_tests/widgets/custom_loading.dart';
import 'package:get/get.dart';

class DashboardBody extends StatefulWidget {
 const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  Future? _future;

  @override
  void initState() {
    super.initState();
    _future = Utilities.isInternetWorking();
  }

  final newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading.customLoading();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == true) {
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
                          BreakingNewsSection(
                            articles: newsController.fetchedData.value.articles,
                          )
                        ],
                      ),
              ),
            ),
          );
        }
        return const Center(
          child: Text(
            "Sorry you have no internet connection ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        );
      },
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
