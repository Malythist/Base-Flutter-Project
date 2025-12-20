import 'package:flutter/material.dart';
import '../../core/extensions/theme_extensions.dart';
import '../design/app_spacing.dart';
import 'custom_button.dart';

class ErrorView extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onRefresh;

  const ErrorView({
    super.key,
    required this.title,
    required this.description,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.defaultPadding),
          decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: context.text.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.defaultPadding),
              CustomButton(
                title: 'Обновить',
                onPressed: onRefresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}