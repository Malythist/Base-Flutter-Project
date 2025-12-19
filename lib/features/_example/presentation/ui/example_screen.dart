import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/ui_exception.dart';
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

    final scheme = Theme.of(context).colorScheme;

    return AppScaffold(
      title: '_example',
      body: async.when(
        loading: () => const LoadingView(),
        error: (e, _) {
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
          itemBuilder: (_, i) {
            final scheme = Theme.of(context).colorScheme;
            final textTheme = Theme.of(context).textTheme;

            return Container(
              decoration: BoxDecoration(
                color: scheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  items[i].title,
                  style: textTheme.titleMedium, // Bold_Text (16/22, medium)
                ),
                subtitle: Text(
                  'id: ${items[i].id}',
                  style: textTheme.labelMedium?.copyWith(
                    color: scheme.onSurface.withOpacity(0.7),
                  ), // Regular_Footnote (13/18)
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
