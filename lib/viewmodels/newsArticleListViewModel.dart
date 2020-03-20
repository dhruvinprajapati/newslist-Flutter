

import 'package:flutter/material.dart';
import 'package:fresh_news/models/newsArticals.dart';
import 'package:fresh_news/services/webservice.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> article = List<NewsArticleViewModel>();

  void populateTopHeadlines() async{
    List<NewsArticle> newsarticle = await Webservice().fetchTopHeadlines();
    this.article = newsarticle.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}