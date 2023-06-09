import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/pages/test_retrofit/todo_list_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/filter_todo_text_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/test_floating_action_button_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/todo_list_widget.dart';

@RoutePage()
class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusDetector(
      onFocusGained: () {
        ref.read(todosNotifierProvider.notifier).refreshTodos();
      },
      child: DefaultLayoutWidget(
        title: 'Todo list page',
        floatingActionButton: const TestFloatingActionButtonWidget(),
        bottomNavigationBar: renderBottomNavigationBar(context, ref),
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  gapH10,
                  FilterTodoTextWidget(),
                  gapH10,
                ],
              ),
            ),
            TodoListWidget(),
          ],
        ),
      ),
    );
  }

  Row renderBottomNavigationBar(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showErrorDialog(
                context,
                '오류!!!!!!!',
                refresh: () {
                  ref
                      .read(todosNotifierProvider.notifier)
                      .refreshTodos(userId: 5);
                  1;
                },
              );
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
