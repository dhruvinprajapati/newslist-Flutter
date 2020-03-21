import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:fresh_news/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  Widget _buildList(NewsArticleListViewModel vm){
    switch(vm.loadingstatus){
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("No Result Found!"));
      case LoadingStatus.completed:
        return Expanded(child: NewsList(article: vm.article));

    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Top news")),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value){
              if(value.isNotEmpty){
                vm.search(value);
              }
            },
            decoration: InputDecoration(
                labelText: "enter search",
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    })),
          ),
          _buildList(vm)
        ],
      ),
    );
  }
}
