import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/example_item.dart';

part 'example_state.freezed.dart';

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    @Default(false) bool isLoading,
    String? error,
    @Default([]) List<ExampleItem> items,
  }) = _ExampleState;
}
