import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/SourceResponse.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      /// internet => remote data source
      var sourceResponse = remoteDataSource.getSources(categoryId);

      /// save sources
      localDataSource.saveSources(await sourceResponse, categoryId);
      return sourceResponse;
    } else {
      /// no internet => local data source
      return localDataSource.getSources(categoryId);
    }
  }
}
