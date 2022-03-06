import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/models/news_model.dart';
import 'package:flutter_tests/utilities/date_time_parser.dart';
import 'package:flutter_tests/utilities/sizeconfig.dart';
import 'package:flutter_tests/widgets/custom_image.dart';

class DescriptionScreen extends StatelessWidget {
  Article? article = Article();

  DescriptionScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: DescriptionBody(article: article),
    );
  }
}

class DescriptionBody extends StatelessWidget {
  Article? article = Article();

  DescriptionBody({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Wrap(
              children: [
                const Icon(Icons.people_alt_rounded),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '${article?.author ?? ''} -> ${DateFormatter.dateFormat(article?.publishedAt ?? DateTime.now())}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Hero(
            tag: article!.author!,
            child: CustomImage(
              imageUrl: article?.urlToImage ?? '',
              imageWidth: SizeConfig.width() * 1,
              imageHeight: SizeConfig.height() * .3,
              cornerRadius: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              article?.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.width() * .05,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              article?.description ?? '',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: SizeConfig.width() * .04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
