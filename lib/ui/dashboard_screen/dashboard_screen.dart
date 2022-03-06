import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/controller/news_controller/news_controller.dart';
import 'package:flutter_tests/widgets/custom_loading.dart';
import 'package:get/get.dart';

import 'components/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: DashboardBody(),
    );
  }

  _appBar() => AppBar(
        title: const Text('Dashboard'),
      );
}
