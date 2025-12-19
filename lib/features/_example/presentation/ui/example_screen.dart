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
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, i) => ListTile(
            title: Text(items[i].title),
            subtitle: Text('id: ${items[i].id}'),
          ),
        ),
      ),
    );
  }
}
