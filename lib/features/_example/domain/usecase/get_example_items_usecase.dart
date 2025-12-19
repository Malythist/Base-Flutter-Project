import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../entity/example_item.dart';
import '../repository/example_repository.dart';

@lazySingleton
class GetExampleItemsUseCase {
  final ExampleRepository _repo;

  GetExampleItemsUseCase(this._repo);

  Future<Result<List<ExampleItem>>> call() => _repo.getItems();
}