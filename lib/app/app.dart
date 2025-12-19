import 'package:flutter/material.dart';
import '../features/_example/presentation/ui/example_screen.dart';
import '../shared/design/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const ExampleScreen(),
    );
  }
}
