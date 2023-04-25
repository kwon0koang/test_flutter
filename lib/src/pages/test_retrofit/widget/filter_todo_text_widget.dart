import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/pages/test_retrofit/todo_list_view_model.dart';

class FilterTodoTextWidget extends HookConsumerWidget {
  const FilterTodoTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 필터 텍스트 초기값으로
    ref.invalidate(filterTodoTextNotifierProvider);

    return TextField(
      decoration: const InputDecoration(
        labelText: 'Filter text',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        ref
            .read(filterTodoTextNotifierProvider.notifier)
            .updateFilterText(value);
      },
    );
  }
}
