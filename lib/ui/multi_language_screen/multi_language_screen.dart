import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languages.dart';

class LanguageApp extends StatelessWidget {
  const LanguageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'greeting'.tr,
              style: Theme.of(context).textTheme.headline4,
            ),
            OutlinedButton(
              onPressed: () => Get.updateLocale(const Locale('us', 'NP')),
              child: const Text('Korean'),
            ),
          ],
        ),
      ),
    );
  }
}