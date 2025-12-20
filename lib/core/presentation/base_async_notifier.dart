import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  Future<T> load();

  @override
  Future<T> build() async {
    final result = await AsyncValue.guard(load);
    state = result;

    return result.when(
      data: (value) => value,
      error: (err, _) => throw err,
      loading: () => throw StateError('Unexpected loading state in build'),
    );
  }

  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(load);
  }
}