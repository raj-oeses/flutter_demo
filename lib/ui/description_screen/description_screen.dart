import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DescriptionBody(),
    );
  }
}

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('DescriptionScreen'),
    );
  }
}

