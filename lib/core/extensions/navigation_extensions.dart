import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  void pop<T extends Object?>([T? result]) {
    GoRouter.of(this).pop(result);
  }

  Future<T?> pushPath<T extends Object?>(String location, {Object? extra}) {
    return GoRouter.of(this).push<T>(location, extra: extra);
  }
}