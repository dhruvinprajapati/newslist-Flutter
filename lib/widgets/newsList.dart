import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  
  final List<NewsArticleViewModel> article;

  NewsList({this.article});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: article.length,
            itemBuilder: (context, index) {
              final articles = article[index];
              return ListTile(
                leading: Container(
                    height: 100,
                    width: 100,
                    child: Image.network(articles.imageUrl)),
                title: Text(articles.title),
              );
            });
  }
}