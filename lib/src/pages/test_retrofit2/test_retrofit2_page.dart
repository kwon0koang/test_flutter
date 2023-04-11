import 'package:auto_route/annotations.dart';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/model/network_result.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_counter/test_counter_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/test_retrofit_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit2/test_retrofit2_view_model.dart';

@RoutePage()
class TestRetrofit2Page extends HookConsumerWidget {
  const TestRetrofit2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retrofitProvider = ref.watch(testRetrofitStateNotifierProvider);

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
          renderTodos(retrofitProvider),
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

  renderTodos(NetworkResult retrofitProvider) {
    if (retrofitProvider is NetworkResultNone) {
      return const SizedBox();
    }
    if (retrofitProvider is NetworkResultLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (retrofitProvider is NetworkResultError) {
      return const Text('에러입니다');
    }
    if (retrofitProvider is NetworkResultSuccess) {
      final todos = retrofitProvider.data as List<TodoModel>;

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
