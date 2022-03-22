import 'dart:convert';

import 'package:news_apps/mixins/server.dart';
import 'package:news_apps/model/news.dart';

import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<News>> getNews() async {
    http.Response value = await http.get(Uri.parse(Server.alamat_api +
        "top-headlines?country=id&apiKey=${Server.api_key}"));

    if (value.statusCode == 200) {
      Map<String, dynamic> response = json.decode(value.body);
      List<dynamic> list_data = response["articles"];
      List<News> list_news = list_data.map((dynamic e) => News.fromMap(e)).toList();
      return list_news;
    } else {
      throw Exception();
    }
  }
}
