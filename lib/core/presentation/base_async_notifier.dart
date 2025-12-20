import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  Future<T> load();

  @override
  Future<T> build() => load();

  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(load);
  }
}