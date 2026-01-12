import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).hoverColor, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  news.author ?? '',

                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(width: 5),
              Text(
                news.publishedAt ?? '',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
