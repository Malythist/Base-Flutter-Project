import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  Widget whenWidget({
    required Widget Function(T data) data,
    required Widget loading,
    required Widget Function(Object error) error,
  }) {
    return when(
      data: data,
      loading: () => loading,
      error: (e, _) => error(e),
    );
  }
}