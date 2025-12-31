import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/extensions/theme_extensions.dart';
import '../shared/design/app_theme.dart';
import 'navigation/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        final navBarColor = context.colors.surface;

        final style = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness:
          isDark ? Brightness.dark : Brightness.light,

          systemNavigationBarColor: navBarColor,
          systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,

          systemNavigationBarContrastEnforced: false,
          systemNavigationBarDividerColor: navBarColor,
        );

        SystemChrome.setSystemUIOverlayStyle(style);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: style,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}