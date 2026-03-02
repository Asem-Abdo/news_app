import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/app_exception.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      // queryParameters: {'apiKey': ApiConstants.apiKey},
    ),
  );

  ApiManager._() {
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
      ),
    );
  }
  // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static ApiManager? _apiManager;
  static ApiManager getInstance() {
    return _apiManager ??= ApiManager._();
  }

  Future<SourceResponse?> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        EndPoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      var json = response.data; // json
      var sourceResponse = SourceResponse.fromJson(json); // json to object
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNews(String sourceId) async {
    try {
      var response = await dio.get(
        EndPoints.newsApi,
        queryParameters: {'sources': sourceId},
      );

      var newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse;
    } catch (e) {
      rethrow;
    }
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'X-Api-Key': ApiConstants.apiKey});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    print('OnResponse => ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    String message = 'Something went wrong';
    try {
      if (err.response?.data is Map &&
          err.response?.data.containsKey('message')) {
        message = err.response?.data['message'];
      } else {
        switch (err.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.connectionError:
            message =
                'Connection time out , please check your internet connection';
            break;
          case DioExceptionType.badResponse:
            message = 'Failed to get data , please try again later';
            break;
          case DioExceptionType.cancel:
            message = 'Request was canceled';
            break;
          case DioExceptionType.unknown:
            message = 'Unknown error occurred';
            break;
          default:
            message = 'Something went wrong';
        }
      }
    } catch (e) {
      message = 'An unexpected error occurred : ${e.toString()}';
    }
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: AppException(message: message),
        response: err.response,
        message: message,
        type: err.type,
      ),
    );
  }
}
