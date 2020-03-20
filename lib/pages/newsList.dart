import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Top news")),
        body: ListView.builder(
            itemCount: vm.article.length,
            itemBuilder: (context, index) {
              final articles = vm.article[index];
              return ListTile(
                leading: Container(
                    height: 100,
                    width: 100,
                    child: Image.network(articles.imageUrl)),
                title: Text(articles.title),
              );
            }));
  }
}
