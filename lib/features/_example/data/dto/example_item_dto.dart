import 'package:freezed_annotation/freezed_annotation.dart';
part 'example_item_dto.freezed.dart';
part 'example_item_dto.g.dart';

@freezed
class ExampleItemDto with _$ExampleItemDto {
  const factory ExampleItemDto({
    required int id,
    required String title,
  }) = _ExampleItemDto;

  factory ExampleItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExampleItemDtoFromJson(json);
}
