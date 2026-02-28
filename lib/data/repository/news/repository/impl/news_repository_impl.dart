import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/model/NewsResponse.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }
}
