import '../../domain/entity/example_item.dart';
import '../dto/example_item_dto.dart';

extension ExampleItemMapper on ExampleItemDto {
  ExampleItem toEntity() => ExampleItem(id: id, title: title);
}
