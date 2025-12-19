import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void showSnack(String message) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  void showErrorSnack(String message) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(this).colorScheme.error,
        ),
      );
  }
}