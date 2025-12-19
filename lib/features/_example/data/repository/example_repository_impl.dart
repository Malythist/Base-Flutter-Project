import 'package:dio/dio.dart';

import '../../../../core/error/dio_failure_mapper.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entity/example_item.dart';
import '../../domain/repository/example_repository.dart';
import '../datasource/example_remote_ds.dart';
import '../mapper/example_item_mapper.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExampleRepository)
class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSource _remote;

  ExampleRepositoryImpl(this._remote);

  @override
  Future<Result<List<ExampleItem>>> getItems() async {
    try {
      final dtos = await _remote.getItems();
      final entities = dtos.map((e) => e.toEntity()).toList();
      return Result.success(entities);
    } on DioException catch (e) {
      return Result.failure(mapDioToFailure(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
