import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/model/SourceResponse.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('SourcesTab');
    //var sourceResponse = SourceResponse.fromJson(box.get(categoryId));
    var sourceResponse = box.get(categoryId);

    return sourceResponse;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async {
    var box = await Hive.openBox('SourcesTab');
    //await box.put(categoryId, sourceResponse?.toJson());
    await box.put(categoryId, SourceResponse());
    await box.close();
  }
}
