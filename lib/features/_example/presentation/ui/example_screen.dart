import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/ui_exception.dart';
import '../../../../core/extensions/async_value_extensions.dart';
import '../../../../core/extensions/theme_extensions.dart';
import '../../../../shared/design/app_spacing.dart';
import '../../../../shared/view/app_scaffold.dart';
import '../../../../shared/view/error_view.dart';
import '../../../../shared/view/loading_view.dart';
import '../../../../shared/view/app_bottom_navigation_bar.dart';
import '../../domain/entity/example_item.dart';
import '../controller/example_controller.dart';

class ExampleScreen extends ConsumerStatefulWidget {
  const ExampleScreen({super.key});

  @override
  ConsumerState<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends ConsumerState<ExampleScreen> {
  int _selectedIndex = 0;

  static const List<AppBottomNavItem> _items = [
    AppBottomNavItem(icon: Icons.list_alt_outlined, label: 'List'),
    AppBottomNavItem(icon: Icons.search_outlined, label: 'Search'),
    AppBottomNavItem(icon: Icons.settings_outlined, label: 'Settings'),
  ];

  void _onNavChanged(int index) {
    if (_selectedIndex == index) return;

    setState(() => _selectedIndex = index);

    //context.go('/someRoute') или navigatorKey.currentState?.push...
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(exampleControllerProvider);
    final controller = ref.read(exampleControllerProvider.notifier);

    return AppScaffold(
      title: 'Example',
      body: _buildBody(asyncValue: asyncValue, controller: controller),
      bottomNavigationBar: AppBottomNavigationBar(
        items: _items,
        selectedIndex: _selectedIndex,
        onChanged: _onNavChanged,
      ),
    );
  }

  Widget _buildBody({
    required AsyncValue<List<ExampleItem>> asyncValue,
    required dynamic controller,
  }) {
    return asyncValue.whenWidget(
      loading: const LoadingView(),
      error: (error) => _ErrorContent(
        error: error,
        onRetry: controller.retry,
      ),
      data: (items) {
        if (_selectedIndex == 0) {
          return _ItemsList(items: items);
        }

        if (_selectedIndex == 1) {
          return const Center(child: Text('Search tab'));
        }

        return const Center(child: Text('Settings tab'));
      },
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
    const spacing = AppSpacing.defaultPadding;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        final isFirst = index == 0;
        final isLast = index == items.length - 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isFirst) const SizedBox(height: spacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing),
              child: DecoratedBox(
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
              ),
            ),
            SizedBox(height: isLast ? spacing : spacing),
          ],
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
