import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/category_details/cubit/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel() : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        /// error
        emit(SourceErrorState(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        /// success
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
