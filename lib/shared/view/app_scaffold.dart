import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsetsGeometry padding;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        title: Text(
          title,
          style: textTheme.headlineSmall, // Bold_Title3 (20/24, medium)
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}
