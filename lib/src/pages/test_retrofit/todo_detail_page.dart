import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/model/todo_model.dart';

@RoutePage()
class TodoDetailPage extends HookConsumerWidget {
  const TodoDetailPage({
    super.key,
    required this.todoModel,
  });

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayoutWidget(
      title: '',
      child: Text(
        '${todoModel.userId} / ${todoModel.id} / ${todoModel.completed} / ${todoModel.title}',
      ),
    );
  }
}
