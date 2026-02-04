import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';
import 'package:news_app/ui/home/news/news_view_model.dart';
import 'package:provider/provider.dart';

import 'news_state/success_news_widget.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.source});
  final Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late NewsViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = NewsViewModel();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsBySourceId(widget.source.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            /// error
            return ErrorStateWidget(
              text: viewModel.errorMessage!,
              textButton: "Retry".tr(),
              onPressed: () {
                viewModel.getNewsBySourceId(widget.source.id ?? '');
              },
            );
          } else if (viewModel.newsList == null) {
            /// loading
            return WaitingStateWidget();
          } else {
            /// success
            return SuccessNewsWidget(
              itemCount: viewModel.newsList!.length,
              newsList: viewModel.newsList!,
            );
          }
        },
        // child: FutureBuilder<NewsResponse>(
        // future: ApiManager.getNews(widget.source.id ?? ''),
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return WaitingStateWidget();
        //   } else if (snapshot.hasError) {
        //     return ErrorStateWidget(
        //       text: "Something went wrong.".tr(),
        //       textButton: "Retry".tr(),
        //       onPressed: () {
        //         ApiManager.getNews(widget.source.id ?? '');
        //         setState(() {});
        //       },
        //     );
        //   } else if (snapshot.data!.status != 'ok') {
        //     return ErrorStateWidget(
        //       text: snapshot.data!.message!,
        //       textButton: "Retry".tr(),
        //       onPressed: () {
        //         ApiManager.getNews(widget.source.id ?? '');
        //         setState(() {});
        //       },
        //     );
        //   }
        //
        //   var newsList = snapshot.data?.articles ?? [];
        //   return SuccessNewsWidget(
        //     itemCount: newsList.length,
        //     newsList: newsList,
        //   );
        // },
        //     ),
      ),
    );
  }
}
