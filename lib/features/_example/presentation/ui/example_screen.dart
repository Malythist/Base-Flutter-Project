import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/ui_exception.dart';
import '../../../../core/extensions/async_value_extensions.dart';
import '../../../../core/extensions/theme_extensions.dart';
import '../../../../shared/view/app_scaffold.dart';
import '../../../../shared/view/error_view.dart';
import '../../../../shared/view/loading_view.dart';
import '../controller/example_controller.dart';

class ExampleScreen extends ConsumerWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(exampleControllerProvider);
    final controller = ref.read(exampleControllerProvider.notifier);

    return AppScaffold(
      title: 'Example',
      body: async.whenWidget(
        loading: const LoadingView(),
        error: (e) {
          final ui = e is UiException
              ? e
              : const UiException(
            title: 'Ошибка',
            description: 'Что-то пошло не так, повторите попытку позже.',
          );

          return ErrorView(
            title: ui.title,
            description: ui.description,
            onRefresh: controller.retry,
          );
        },
        data: (items) => ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) => Container(
            decoration: BoxDecoration(
              color: context.colors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                items[i].title,
                style: context.text.titleMedium,
              ),
              subtitle: Text(
                'id: ${items[i].id}',
                style: context.text.labelMedium?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
