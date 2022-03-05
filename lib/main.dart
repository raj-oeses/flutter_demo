import 'package:flutter/material.dart';
import 'package:flutter_tests/controller/controller_binding.dart';
import 'package:flutter_tests/ui/dashboard_screen/dashboard_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const FlutterTestApp());
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test Project',
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashboardScreen(),
    );
  }
}

