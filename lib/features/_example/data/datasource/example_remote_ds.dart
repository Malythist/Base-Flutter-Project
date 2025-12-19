import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_config.dart';
import '../dto/example_item_dto.dart';

abstract class ExampleRemoteDataSource {
  Future<List<ExampleItemDto>> getItems();
}

@LazySingleton(as: ExampleRemoteDataSource)
class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final Dio _dio;
  final ApiConfig _config;

  ExampleRemoteDataSourceImpl(this._dio, this._config);

  @override
  Future<List<ExampleItemDto>> getItems() async {
    final url = _config.baseUrl + '/todos';
    print('REQUEST START');
    final res = await _dio.get(url);
    print('REQUEST END ${res.statusCode}');

    final list = (res.data as List).cast<Map<String, dynamic>>();
    return list
        .map((e) => ExampleItemDto(
      id: e['id'] as int,
      title: e['title'] as String,
    ))
        .toList();
  }
}