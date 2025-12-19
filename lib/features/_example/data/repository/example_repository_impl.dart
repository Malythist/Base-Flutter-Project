import 'package:injectable/injectable.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/result.dart';
import '../../domain/entity/example_item.dart';
import '../../domain/repository/example_repository.dart';
import '../datasource/example_remote_ds.dart';
import '../mapper/example_item_mapper.dart';

@LazySingleton(as: ExampleRepository)
class ExampleRepositoryImpl extends BaseRepository implements ExampleRepository {
  final ExampleRemoteDataSource _remote;

  ExampleRepositoryImpl(this._remote);

  @override
  Future<Result<List<ExampleItem>>> getItems() {
    return safeCall(() async {
      final dtos = await _remote.getItems();
      return dtos.map((e) => e.toEntity()).toList();
    });
  }
}
