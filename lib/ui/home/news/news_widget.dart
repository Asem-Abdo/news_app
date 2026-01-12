import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';

import 'news_state/success_news_widget.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.source});
  final Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return WaitingStateWidget();
        } else if (snapshot.hasError) {
          return ErrorStateWidget(
            text: "Something went wrong.".tr(),
            textButton: "Retry".tr(),
            onPressed: () {
              ApiManager.getNews(widget.source.id ?? '');
              setState(() {});
            },
          );
        } else if (snapshot.data!.status != 'ok') {
          return ErrorStateWidget(
            text: snapshot.data!.message!,
            textButton: "Retry".tr(),
            onPressed: () {
              ApiManager.getNews(widget.source.id ?? '');
              setState(() {});
            },
          );
        }

        var newsList = snapshot.data?.articles ?? [];
        return SuccessNewsWidget(
          itemCount: newsList.length,
          newsList: newsList,
        );
      },
    );
  }
}
