import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/news_state/success_news_widget.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.source});
  final Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsBySourceId(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsSuccessState) {
          return SuccessNewsWidget(
            itemCount: state.newsList.length,
            newsList: state.newsList,
          );
        } else if (state is NewsErrorState) {
          return ErrorStateWidget(
            text: state.errorMessage,
            textButton: "Retry",
            onPressed: () {
              viewModel.getNewsBySourceId(widget.source.id!);
            },
          );
        } else {
          return WaitingStateWidget();
        }
      },
    );
  }
}
