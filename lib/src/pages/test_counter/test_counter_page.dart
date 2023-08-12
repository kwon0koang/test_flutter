import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/pages/test_counter/test_counter_view_model.dart';
import 'package:test_flutter/src/pages/test_riverpod/test_riverpod_view_model.dart';

@RoutePage()
class TestCounterPage extends HookConsumerWidget {
  const TestCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countProvider = ref.watch(countStateNotifierProvider);

    return DefaultLayoutWidget(
      title: '',
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
            const Test2Widget(),
            const Test3Widget(),
          ],
        ),
      ),
    );
  }
}

class Test2Widget extends HookConsumerWidget {
  const Test2Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testInt2 = ref.watch(testInt2Provider);
    return ElevatedButton(
      onPressed: () {
        ref.read(testInt2Provider.notifier).increment();
      },
      child: testInt2.when(
        data: (data) {
          return Text(
            data.toString(),
          );
        },
        error: (error, stackTrace) {
          showErrorDialog(
            context,
            error.toString(),
            refresh: () {
              ref.read(testInt2Provider.notifier).increment();
              ref.read(testInt3Provider.notifier).increment();
            },
          );
          return null;
          // return const SizedBox.shrink();
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class Test3Widget extends HookConsumerWidget {
  const Test3Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testInt3 = ref.watch(testInt3Provider);
    return ElevatedButton(
      onPressed: () {
        ref.read(testInt3Provider.notifier).increment();
      },
      child: testInt3.when(
        data: (data) {
          return Text(
            data.toString(),
          );
        },
        error: (error, stackTrace) {
          showErrorDialog(
            context,
            error.toString(),
            refresh: () {
              ref.read(testInt2Provider.notifier).increment();
              ref.read(testInt3Provider.notifier).increment();
            },
          );
          return const SizedBox.shrink();
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
