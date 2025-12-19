import 'package:freezed_annotation/freezed_annotation.dart';
part 'example_item.freezed.dart';

@freezed
class ExampleItem with _$ExampleItem {
  const factory ExampleItem({
    required int id,
    required String title,
  }) = _ExampleItem;
}
