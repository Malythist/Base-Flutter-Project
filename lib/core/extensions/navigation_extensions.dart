import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  // Возврат результата в предыдущий экран
  void pop<T extends Object?>([T? result]) {
    GoRouter.of(this).pop(result);
  }

  // Переход на экран по пути с передачей аргументов (extra)
  // и ожиданием результата
  Future<T?> pushPath<T extends Object?>(String location, {Object? extra}) {
    return GoRouter.of(this).push<T>(location, extra: extra);
  }
}