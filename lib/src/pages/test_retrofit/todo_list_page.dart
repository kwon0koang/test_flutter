import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/filter_todo_text_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/test_floating_action_button_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/todo_list_widget.dart';

@RoutePage()
class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 화면 진입 시 데이터 새로고침 필요할 때. 기존 구 데이터를 잘 보여주고 있는 상태일 때, 새로고침한다.
    // final todosNotifier = ref.read(todosNotifierProvider.notifier);
    // if (todosNotifier.state is AsyncData) {
    //   todosNotifier.refreshTodos(userId: 2);
    // }

    return DefaultLayout(
      title: 'Todo list page',
      floatingActionButton: const TestFloatingActionButtonWidget(),
      bottomNavigationBar: renderBottomNavigationBar(),
      child: Column(
        children: [
          gapH10,
          const FilterTodoTextWidget(),
          gapH10,
          TodoListWidget(),
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
}
