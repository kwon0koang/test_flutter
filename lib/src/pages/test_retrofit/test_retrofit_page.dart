import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_counter/test_counter_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/test_retrofit_view_model.dart';

@RoutePage()
class TestRetrofitPage extends HookConsumerWidget {
  const TestRetrofitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(testRetrofitViewModelProvider);

    return DefaultLayout(
      title: 'Test retrofit',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'todo',
              style: TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                viewModel.getTodos().then(
                      (todos) => {
                        todos.forEach(
                          (todo) {
                            Log.d('${todo.title}');
                          },
                        )
                      },
                    );
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
