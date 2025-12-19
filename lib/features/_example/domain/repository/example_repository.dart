import '../../../../core/error/result.dart';
import '../entity/example_item.dart';

abstract class ExampleRepository {
  Future<Result<List<ExampleItem>>> getItems();
}
