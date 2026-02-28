// interface news repository
import 'package:news_app/model/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNews(String sourceId);
}
