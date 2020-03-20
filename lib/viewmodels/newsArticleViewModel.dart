

import 'package:fresh_news/models/newsArticals.dart';

class NewsArticleViewModel { 
  NewsArticle _newsArticle;
  NewsArticleViewModel({NewsArticle article}):_newsArticle = article;

  String get title {
    return _newsArticle.title;
  }
  String get desciption{
    return _newsArticle.description;
  }
  String get imageUrl{
    return _newsArticle.urlToImage;
  }
  String get url{
    return _newsArticle.url;
  }
}