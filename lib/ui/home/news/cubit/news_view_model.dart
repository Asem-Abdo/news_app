import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';

import 'news_states.dart';

@injectable
class NewsViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      /// loading
      emit(NewsLoadingState());
      var response = await newsRepository.getNews(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
