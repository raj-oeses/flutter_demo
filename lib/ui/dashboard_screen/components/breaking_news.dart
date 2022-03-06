import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tests/models/news_model.dart';
import 'package:flutter_tests/ui/description_screen/description_screen.dart';
import 'package:flutter_tests/utilities/date_time_parser.dart';
import 'package:flutter_tests/utilities/sizeconfig.dart';
import 'package:flutter_tests/widgets/custom_image.dart';
import 'package:get/get.dart';

class BreakingNewsSection extends StatelessWidget {
  List<Article>? articles = <Article>[];

  BreakingNewsSection({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      // scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          BreakingNewsItem(article: articles?[index]),
    );
  }
}

// ignore: must_be_immutable
class BreakingNewsItem extends StatelessWidget {
  Article? article = Article();

  BreakingNewsItem({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => DescriptionScreen(article: article)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 010),
        child: SizedBox(
          height: SizeConfig.height() * .38,
          child: Stack(
            children: [
              Hero(
                tag: article!.author!,
                child: CustomImage(
                  imageUrl: article?.urlToImage ?? '',
                  imageWidth: SizeConfig.width() * 1,
                  imageHeight: SizeConfig.height() * .3,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '${article?.author ?? ''} -> ${DateFormatter.dateFormat(article?.publishedAt ?? DateTime.now())}',
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            article?.title ?? '',
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            article?.description ?? '',
                            maxLines: 3,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
