import 'package:flutter/material.dart';
import '../../core/extensions/theme_extensions.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.primary,
      ),
    );
  }
}
