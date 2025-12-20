import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/ui_exception.dart';
import '../../../../core/extensions/async_value_extensions.dart';
import '../../../../core/extensions/theme_extensions.dart';
import '../../../../shared/view/app_scaffold.dart';
import '../../../../shared/view/error_view.dart';
import '../../../../shared/view/loading_view.dart';
import '../../domain/entity/example_item.dart';
import '../controller/example_controller.dart';

class ExampleScreen extends ConsumerWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(exampleControllerProvider);
    final controller = ref.read(exampleControllerProvider.notifier);

    return AppScaffold(
      title: 'Example',
      body: asyncValue.whenWidget(
        loading: const LoadingView(),
        error: (error) => _ErrorContent(
          error: error,
          onRetry: controller.retry,
        ),
        data: (items) => _ItemsList(items: items),
      ),
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList({
    required this.items,
  });

  final List<ExampleItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final item = items[index];

        return Container(
          decoration: BoxDecoration(
            color: context.colors.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              item.title,
              style: context.text.titleMedium,
            ),
            subtitle: Text(
              'id: ${item.id}',
              style: context.text.labelMedium?.copyWith(
                color: context.colors.onSurface.withOpacity(0.7),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({
    required this.error,
    required this.onRetry,
  });

  final Object error;
  final VoidCallback onRetry;

  UiException get _uiException {
    if (error is UiException) {
      return error as UiException;
    }

    return const UiException(
      title: 'Ошибка',
      description: 'Что-то пошло не так, повторите попытку позже.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui = _uiException;

    return ErrorView(
      title: ui.title,
      description: ui.description,
      onRefresh: onRetry,
    );
  }
}