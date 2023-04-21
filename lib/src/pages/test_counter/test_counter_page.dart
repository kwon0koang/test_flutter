import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/pages/test_counter/test_counter_view_model.dart';

@RoutePage()
class TestCounterPage extends HookConsumerWidget {
  const TestCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countProvider = ref.watch(countStateNotifierProvider);

    return DefaultLayout(
      title: 'Test counter page',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$countProvider',
              style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(countStateNotifierProvider.notifier).increment();
              },
              child: const Text('+'),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                ref.read(countStateNotifierProvider.notifier).decrement();
              },
              child: const Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
