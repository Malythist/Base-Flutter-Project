import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/di.dart';
import '../../domain/usecase/get_example_items_usecase.dart';
import '../state/example_state.dart';

final exampleControllerProvider =
NotifierProvider<ExampleController, ExampleState>(ExampleController.new);

class ExampleController extends Notifier<ExampleState> {
  late final GetExampleItemsUseCase _getItems;

  @override
  ExampleState build() {
    _getItems = getIt<GetExampleItemsUseCase>();

    // ВАЖНО: стартуем загрузку ПОСЛЕ того как provider инициализируется
    scheduleMicrotask(_load);

    // Возвращаем начальное состояние
    return const ExampleState(isLoading: true);
  }

  Future<void> retry() => _load();

  Future<void> _load() async {
    // Не читаем state до первого присваивания
    state = const ExampleState(isLoading: true);

    try {
      final result = await _getItems();

      state = result.when(
        success: (items) => ExampleState(isLoading: false, items: items),
        failure: (f) => ExampleState(isLoading: false, error: f.toString()),
      );
    } catch (e) {
      state = ExampleState(isLoading: false, error: e.toString());
    }
  }
}
