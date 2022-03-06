import 'package:flutter/material.dart';
import 'package:flutter_tests/models/news_model.dart';

class DescriptionScreen extends StatelessWidget {
  Article? article = Article();
   DescriptionScreen({Key? key, required this.article}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DescriptionBody(article: article),
    );
  }
}

class DescriptionBody extends StatelessWidget {
  Article? article = Article();
   DescriptionBody({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('DescriptionScreen'),
    );
  }
}

