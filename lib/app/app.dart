import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared/design/app_theme.dart';
import 'navigation/router.dart';

class App extends ConsumerWidget { // Меняем на ConsumerWidget
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем роутер через ref.watch
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}