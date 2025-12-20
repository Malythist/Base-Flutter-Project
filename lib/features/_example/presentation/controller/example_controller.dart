import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/di.dart';
import '../../../../core/error/failure_ui.dart';
import '../../../../core/error/ui_exception.dart';
import '../../../../core/presentation/base_async_notifier.dart';
import '../../domain/entity/example_item.dart';
import '../../domain/usecase/get_example_items_usecase.dart';

final getExampleItemsUseCaseProvider =
getItProvider<GetExampleItemsUseCase>();

final exampleControllerProvider =
AsyncNotifierProvider<ExampleController, List<ExampleItem>>(
  ExampleController.new,
);

class ExampleController extends BaseAsyncNotifier<List<ExampleItem>> {
  @override
  Future<List<ExampleItem>> load() async {
    final getItems = ref.read(getExampleItemsUseCaseProvider);
    final result = await getItems();

    return result.when(
      success: (items) => items,
      failure: (f) => throw f.toUiException(),
    );
  }
}