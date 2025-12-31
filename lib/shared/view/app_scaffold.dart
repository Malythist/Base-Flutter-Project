import 'package:flutter/material.dart';
import '../../core/extensions/theme_extensions.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final Widget? bottomNavigationBar;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.padding = EdgeInsets.zero,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        foregroundColor: context.colors.onSurface,
        elevation: 0,
        title: Text(
          title,
          style: context.text.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar == null
          ? null
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          bottomNavigationBar!,

          // заливка под системную навигацию
          if (bottomInset > 0)
            Container(
              height: bottomInset,
              width: double.infinity,
              color: context.colors.cardViewBackground,
            ),
        ],
      ),
    );
  }
}