import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsArticleDetailsPage.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> article;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.article,this.onSelected});

  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: article.length,
        itemBuilder: (context, index) {
          final articles = article[index];
          return ListTile(
            onTap: () {
              // _showNewsArticleDetails(context, articles);
              this.onSelected(articles);
            },
            leading: Container(
                height: 100,
                width: 100,
                child: Image.network(articles.imageUrl)),
            title: Text(articles.title),
          );
        });
  }
}
