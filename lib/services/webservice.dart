import 'dart:convert';

import 'package:fresh_news/models/newsArticals.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        "http://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=27aafa002a324c3fb9d80fe2f2c69977";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
