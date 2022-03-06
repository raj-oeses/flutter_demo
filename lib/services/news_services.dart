import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tests/models/news_model.dart';
import 'package:flutter_tests/utilities/date_time_parser.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  static Future<NewsModel?> getNews() async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=tesla&from=${DateFormatter.dateFormat(DateTime.now())}&sortBy=publishedAt&apiKey=1003e994eb4342079d6d359506836f86';

    NewsModel newsModel = NewsModel();
    try {
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      debugPrint('using Url $newsUrl');
      var response = await http.get(Uri.parse(newsUrl), headers: headers);
      if (response.statusCode == 200) {
        debugPrint('data of plans and vision is ${response.body}');
        newsModel = newsModelFromJson(response.body);
      } else {
        debugPrint('status code is ${response.statusCode}');
        newsModel = newsModelFromJson(response.body);
      }
      return newsModel;
    } on Exception catch (e) {
      debugPrint('exception is $e}');
      // TODO
    }
  }
// static Future<PlansAndVisionsModel?> getNews() async {
//   PlansAndVisionsModel? data = PlansAndVisionsModel();
//   try {
//     var headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     debugPrint('using Url $plansVisionsUrl');
//     var response =
//     await http.get(Uri.parse(plansVisionsUrl), headers: headers);
//     if ( response.statusCode == 200) {
//       debugPrint('data of plans and vision is ${response.body}');
//       data = plansAndVisionsModelFromJson(response.body);
//     } else {
//       debugPrint('status code is ${response.statusCode}');
//       data = plansAndVisionsModelFromJson(response.body);
//     }
//     return data;
//   } on Exception catch (e) {
//     debugPrint('the exception is $e');
//   }
// }
}
