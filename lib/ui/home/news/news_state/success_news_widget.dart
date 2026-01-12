import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';

class SuccessNewsWidget extends StatelessWidget {
  const SuccessNewsWidget({
    super.key,
    required this.itemCount,
    required this.newsList,
  });
  final int? itemCount;
  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsItem(news: newsList[index]);
      },
      itemCount: newsList.length,
    );
  }
}
