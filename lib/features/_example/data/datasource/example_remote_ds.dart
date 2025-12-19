import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/base_remote_data_source.dart';
import '../../../../core/network/api_config.dart';
import '../dto/example_item_dto.dart';

abstract class ExampleRemoteDataSource {
  Future<List<ExampleItemDto>> getItems();
}

@LazySingleton(as: ExampleRemoteDataSource)
class ExampleRemoteDataSourceImpl
    extends BaseRemoteDataSource
    implements ExampleRemoteDataSource {
  static const String API_METHOD = '/todos';

  ExampleRemoteDataSourceImpl(
      Dio dio,
      ApiConfig apiConfig,
      ) : super(dio, apiConfig);

  @override
  Future<List<ExampleItemDto>> getItems() async {
    final rawItems = await getListJson(API_METHOD);

    return rawItems
        .map(
          (item) => ExampleItemDto(
        id: item['id'] as int,
        title: item['title'] as String,
      ),
    )
        .toList();
  }
}