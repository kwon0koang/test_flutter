import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/todo_list_view_model.dart';

@RoutePage()
class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: 'Todo list page',
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(todosStateNotifierProvider.notifier).getTodos();
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
    final AsyncValue<List<TodoModel>> todosResult =
        ref.watch(todosStateNotifierProvider);

    return todosResult.when(
      error: (error, stackTrace) {
        return Center(
          child: Text('에러입니다 ($error)'),
        );
      },
      loading: () {
        const Center(
          child: CircularProgressIndicator(),
        );
      },
      data: (todos) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todoModel = todos[index];

            return GestureDetector(
              onTap: () {
                Log.d(
                    'Clicked ${todoModel.userId} / ${todoModel.id} / ${todoModel.title}');
                AutoRouter.of(context).push(
                  TodoDetailRoute(todoModel: todoModel),
                );
              },
              child: Text(
                '${todoModel.userId} / ${todoModel.id} / ${todoModel.completed} / ${todoModel.title}',
              ),
            );
          },
        );
      },
    );
  }
}
