import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/filter_todo_text_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/test_floating_action_button_widget.dart';
import 'package:test_flutter/src/pages/test_retrofit/widget/todo_list_widget.dart';

@RoutePage()
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Todo list page',
      floatingActionButton: const TestFloatingActionButtonWidget(),
      bottomNavigationBar: renderBottomNavigationBar(),
      child: Column(
        children: const [
          gapH10,
          FilterTodoTextWidget(),
          gapH12,
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
