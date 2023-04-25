import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/pages/test_retrofit/todo_list_view_model.dart';

class TestFloatingActionButtonWidget extends HookConsumerWidget {
  const TestFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(todosNotifierProvider.notifier).refreshTodos();
      },
      child: const Text('Send'),
    );
  }
}
