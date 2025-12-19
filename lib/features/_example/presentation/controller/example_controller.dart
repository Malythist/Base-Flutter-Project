import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/di.dart';
import '../../../../core/error/failure_ui.dart';
import '../../../../core/error/ui_exception.dart';
import '../../domain/entity/example_item.dart';
import '../../domain/usecase/get_example_items_usecase.dart';

final exampleControllerProvider =
AsyncNotifierProvider<ExampleController, List<ExampleItem>>(
  ExampleController.new,
);

class ExampleController extends AsyncNotifier<List<ExampleItem>> {
  late final GetExampleItemsUseCase _getItems;

  @override
  Future<List<ExampleItem>> build() async {
    _getItems = getIt<GetExampleItemsUseCase>();
    return _load();
  }

  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  Future<List<ExampleItem>> _load() async {
    final result = await _getItems();

    return result.when(
      success: (items) => items,
      failure: (f) => throw f.toUiException(),
    );
  }
}
