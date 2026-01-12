import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

/*
 https://newsapi.org/v2/top-headlines/sources
 ?apiKey=b5d21532eafc46e197bafde4076e6079
*/
class ApiManager {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;

      /// convert String to json => use jsonDecode()
      var json = jsonDecode(responseBody);

      /// convert json to object
      return SourceResponse.fromJson(json);

      /// notation
      ///  return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5d21532eafc46e197bafde4076e6079
   */

  static Future<NewsResponse>? getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      // var responseBody = response.body;
      // var json = jsonDecode(responseBody);
      // return NewsResponse.fromJson(json);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
