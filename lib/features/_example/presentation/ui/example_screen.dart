import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/example_controller.dart';

class ExampleScreen extends ConsumerWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exampleControllerProvider);
    final controller = ref.read(exampleControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('_example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.error != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error!, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.retry,
                    child: const Text('Повторить'),
                  ),
                ],
              )
            : ListView.separated(
                itemCount: state.items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) => ListTile(
                  title: Text(state.items[i].title),
                  subtitle: Text('id: ${state.items[i].id}'),
                ),
              ),
      ),
    );
  }
}
