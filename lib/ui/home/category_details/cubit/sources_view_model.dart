import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/ui/home/category_details/cubit/sources_state.dart';

@injectable
class SourcesViewModel extends Cubit<SourcesStates> {
  SourceRepository sourceRepository;

  SourcesViewModel({required this.sourceRepository})
    : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
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
