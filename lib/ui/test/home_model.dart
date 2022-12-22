import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModelCategory {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? pics;

  HomeModelCategory({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.pics,
  });

  HomeModelCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    icon = json['icon']?.toString();
    pics = json['pics']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['pics'] = pics;
    return data;
  }
}

class HomeModelBanner {
/*
{
  "id": 30,
  "name": "WE ARE OPEN NOW",
  "slug": "we-are-open-now",
  "link": "https://www.gyapu.com/",
  "image_url": "https://maahuri.com/uploads/banners/laxxery-images-d6g1mmvk9z1k6mzwcuqibken7xpwpu.jpg"
}
*/

  int? id;
  String? name;
  String? slug;
  String? link;
  String? imageUrl;

  HomeModelBanner({
    this.id,
    this.name,
    this.slug,
    this.link,
    this.imageUrl,
  });

  HomeModelBanner.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    link = json['link']?.toString();
    imageUrl = json['image_url']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['link'] = link;
    data['image_url'] = imageUrl;
    return data;
  }
}

class HomeModel {
/*
{
  "success": true,
  "banner": [
    {
      "id": 30,
      "name": "WE ARE OPEN NOW",
      "slug": "we-are-open-now",
      "link": "https://www.gyapu.com/",
      "image_url": "https://maahuri.com/uploads/banners/laxxery-images-d6g1mmvk9z1k6mzwcuqibken7xpwpu.jpg"
    }
  ],
  "category": [
    {
      "id": 58,
      "name": "LAXXERY FASHION",
      "slug": "laxxery-fashion",
      "icon": "https://maahuri.com/uploads/category/laxxery-images-0ktxe8wuy066ze6gbfbacxiqzshurd.jpg",
      "pics": "https://maahuri.com/uploads/category/laxxery-images-zpkgsk0fivbf4nohvl4usizeizh0jm.jpg"
    }
  ]
}
*/

  bool? success;
  List<HomeModelBanner?>? banner;
  List<HomeModelCategory?>? category;

  HomeModel({
    this.success,
    this.banner,
    this.category,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['banner'] != null) {
      final v = json['banner'];
      final arr0 = <HomeModelBanner>[];
      v.forEach((v) {
        arr0.add(HomeModelBanner.fromJson(v));
      });
      banner = arr0;
    }
    if (json['category'] != null) {
      final v = json['category'];
      final arr0 = <HomeModelCategory>[];
      v.forEach((v) {
        arr0.add(HomeModelCategory.fromJson(v));
      });
      category = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (banner != null) {
      final v = banner;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['banner'] = arr0;
    }
    if (category != null) {
      final v = category;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['category'] = arr0;
    }
    return data;
  }
}
