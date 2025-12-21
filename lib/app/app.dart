import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared/design/app_theme.dart';
import 'navigation/router.dart';

class App extends ConsumerStatefulWidget { // Меняем на ConsumerStatefulWidget для работы с жизненным циклом
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();

    // Инициализируем слушатель жизненного цикла
    _lifecycleListener = AppLifecycleListener(
      onResume: () => debugPrint('App Resumed'),
      onInactive: () => debugPrint('App Inactive'),
      onPause: () => debugPrint('App Paused'),
      onDetach: () => debugPrint('App Detached'),
      onRestart: () => debugPrint('App Restarted'),
      // Можно добавить обработку закрытия приложения (например, для сохранения логов)
      onExitRequested: () async {
        debugPrint('App Exit Requested');
        return AppExitResponse.exit;
      },
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose(); // Обязательно освобождаем ресурсы
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}