import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';

import 'news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      /// loading
      emit(NewsLoadingState());
      var response = await ApiManager.getNews(sourceId);
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
