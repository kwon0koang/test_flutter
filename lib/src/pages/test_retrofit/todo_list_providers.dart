import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/extension/ref.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/repository/todo_repository.dart';

part 'todo_list_providers.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  FutureOr<List<TodoModel>> build() async {
    ref.keepAliveForAWhile();
    // ref.invalidateSelfFor(const Duration(seconds: 5));
    return _getTodos();
  }

  Future<List<TodoModel>> _getTodos({int? userId}) async {
    // 구 데이터 잘 보여지고 있는 상황에 스켈레톤 보여주지 않기 위함
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }

    // 테스트 지연
    await Future.delayed(const Duration(seconds: 1));

    final todos =
        await ref.read(todoRepositoryProvider).getTodos(userId: userId);
    return todos;
  }

  Future<void> refreshTodos({int? userId}) async {
    state = await AsyncValue.guard(
      () => _getTodos(userId: userId),
    );
  }
}

@riverpod
class FilterTodoText extends _$FilterTodoText {
  @override
  String build() {
    return '';
  }

  void updateFilterText(String filterText) {
    state = filterText;
  }
}

@riverpod
AsyncValue<List<TodoModel>> filteredTodos(FilteredTodosRef ref) {
  final filterTodoText = ref.watch(filterTodoTextProvider);
  final asyncTodos = ref.watch(todosProvider);
  return asyncTodos.whenData((todos) {
    final filteredTodos = todos
        .where(
          (todos) => todos.title.contains(filterTodoText),
        )
        .toList();
    return filteredTodos;
  });
}
