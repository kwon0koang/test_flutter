import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_retrofit2/test_retrofit2_view_model.dart';

@RoutePage()
class TestRetrofit2Page extends HookConsumerWidget {
  const TestRetrofit2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: 'Test retrofit2',
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(testRetrofitStateNotifierProvider.notifier).getTodos();
        },
        child: const Text('Send'),
      ),
      bottomNavigationBar: renderBottomNavigationBar(),
      child: Column(
        children: [
          gapH12,
          renderTodos(ref),
        ],
      ),
    );
  }

  Row renderBottomNavigationBar() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Log.d('Clicked 버튼 1');
            },
            child: const Text('버튼 1'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Log.d('Clicked 버튼 2');
            },
            child: const Text('버튼 2'),
          ),
        ),
      ],
    );
  }

  renderTodos(WidgetRef ref) {
    final AsyncValue<List<TodoModel>> retrofitResult =
        ref.watch(testRetrofitStateNotifierProvider);

    if (retrofitResult is AsyncLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (retrofitResult is AsyncError) {
      return const Text('에러입니다');
    } else {
      final todos = retrofitResult.value as List<TodoModel>;
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final model = todos[index];

          return Column(
            children: [
              gapH8,
              Row(
                children: [
                  Text('${model.userId} / '),
                  gapW4,
                  Text('${model.id} / '),
                  gapW4,
                  Text('${model.completed} / '),
                  gapW4,
                  Expanded(
                    child: Text(model.title),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }
  }
}
