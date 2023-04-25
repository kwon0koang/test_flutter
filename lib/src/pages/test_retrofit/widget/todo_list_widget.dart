import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/todo_list_view_model.dart';

class TodoListWidget extends HookConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AsyncValue<List<TodoModel>> asyncTodos =
    //     ref.watch(todosStateNotifierProvider);
    final AsyncValue<List<TodoModel>> asyncFilteredTodos =
        ref.watch(filteredTodosProvider);

    return asyncFilteredTodos.when(
      error: (error, stackTrace) {
        return Center(
          child: Text('에러입니다 ($error)'),
        );
      },
      loading: () {
        return const Center(
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
