import 'package:flutter/material.dart';
import 'package:fresh_news/models/newsArticals.dart';
import 'package:fresh_news/services/webservice.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingstatus = LoadingStatus.searching;
  List<NewsArticleViewModel> article = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    this.loadingstatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await Webservice().fetchHeadLinesByKeywords(keyword);
    this.article = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingstatus =
        this.article.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    this.loadingstatus = LoadingStatus.searching;
    // notifyListeners();
    List<NewsArticle> newsarticle = await Webservice().fetchTopHeadlines();
    this.article = newsarticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingstatus =
        this.article.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
