import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: DashboardBody(),
    );
  }

  _appBar() =>AppBar(
    title:const Text('Dashboard'),
  );
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('DashboardScreen'),
    );
  }
}
