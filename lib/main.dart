import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsListPage.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fresh news",
      home: ChangeNotifierProvider(
        child: NewsListPage(), create: (_) => new NewsArticleListViewModel(),
      )
    );
  }
}

