import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tests/models/news_model.dart';
import 'package:flutter_tests/utilities/date_time_parser.dart';
import 'package:flutter_tests/utilities/internet_check.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  static Future<Either<NewsModel,String>?> getNews() async {
    String newsUrl = 'https://newsapi.org/v2/everything?q=tesla&from=${DateFormatter.dateFormat(DateTime.now())}&sortBy=publishedAt&apiKey=1003e994eb4342079d6d359506836f86';

    NewsModel newsModel = NewsModel();
    if (await Utilities.isInternetWorking()) {
      try {
        var headers = {
          HttpHeaders.contentTypeHeader: 'application/json',
        };
        debugPrint('using Url $newsUrl');
        var response = await http.get(Uri.parse(newsUrl), headers: headers);
        if (response.statusCode == 200) {
          debugPrint('data of plans and vision is ${response.body}');
          newsModel = newsModelFromJson(response.body);
          return Left(newsModel);
          // return Right('Error');
        } else {
          debugPrint('status code is ${response.statusCode}');
          newsModel = newsModelFromJson(response.body);
          return Right('Error');
        }
        // return Left(newsModel);
      } on Exception catch (e) {
        debugPrint('exception is $e}');
        // TODO
      }
    }
    else {
      Get.snackbar('Error', 'No Internet');
    }
  }
}
// class NewsServices {
//   static Future<NewsModel?> getNews() async {
//     String newsUrl = 'https://newsapi.org/v2/everything?q=tesla&from=${DateFormatter.dateFormat(DateTime.now())}&sortBy=publishedAt&apiKey=1003e994eb4342079d6d359506836f86';
//
//     NewsModel newsModel = NewsModel();
//     if (await Utilities.isInternetWorking()) {
//       try {
//         var headers = {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         };
//         debugPrint('using Url $newsUrl');
//         var response = await http.get(Uri.parse(newsUrl), headers: headers);
//         if (response.statusCode == 200) {
//           debugPrint('data of plans and vision is ${response.body}');
//           newsModel = newsModelFromJson(response.body);
//         } else {
//           debugPrint('status code is ${response.statusCode}');
//           newsModel = newsModelFromJson(response.body);
//         }
//         return newsModel;
//       } on Exception catch (e) {
//         debugPrint('exception is $e}');
//         // TODO
//       }
//     }
//     else {
//       Get.snackbar('Error', 'No Internet');
//     }
//   }
// }
