import 'package:flutter/material.dart';
import '../features/_example/presentation/ui/example_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleScreen(),
    );
  }
}
