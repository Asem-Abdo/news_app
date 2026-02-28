// import 'package:news_app/api/api_manager.dart';
// import 'package:news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
// import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
// import 'package:news_app/data/repository/news/repository/impl/news_repository_impl.dart';
// import 'package:news_app/data/repository/news/repository/news_repository.dart';
// import 'package:news_app/data/repository/sources/data_sources/local/impl/source_local_data_source_impl.dart';
// import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
// import 'package:news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
// import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
// import 'package:news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
// import '../data/repository/sources/repository/source_repository.dart';
//
// /// view model                        => object source repository
// /// source repository                 => object source remote data source
// /// source remote data source         => object ApiManager
// /// -------------------------------------------------------------
// /// view model                        => object news repository
// /// news repository                   => object news remote data source
// /// news remote data source           => object ApiManager
//
// SourceRepository injectSourceRepository() {
//   return SourceRepositoryImpl(
//     remoteDataSource: injectSourceRemoteDataSource(),
//     localDataSource: injectSourceLocalDataSource(),
//   );
// }
//
// SourceRemoteDataSource injectSourceRemoteDataSource() {
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
//
// SourceLocalDataSource injectSourceLocalDataSource() {
//   return SourceLocalDataSourceImpl();
// }
//
// /// -------------------------------------------------------------------
//
// NewsRepository injectNewsRepository() {
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
//
// NewsRemoteDataSource injectNewsRemoteDataSource() {
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
