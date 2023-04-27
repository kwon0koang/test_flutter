import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModelNotifier extends _$TodoListViewModelNotifier {
  late final TodoService todoService;

  @override
  void build() {}
}

@riverpod
class TodosNotifier extends _$TodosNotifier {
  late final TodoService _todoService;

  @override
  FutureOr<List<TodoModel>> build() async {
    _todoService = TodoService(ref);
    ref.keepAliveForAWhile();
    return _getTodos();
  }

  Future<List<TodoModel>> _getTodos({int? userId}) async {
    Log.d('TodosNotifier / getTodos / userId:$userId / $state');
    try {
      // 구 데이터 잘 보여지고 있는 상황에 스켈레톤 보여주지 않기 위함
      if (state is! AsyncData) {
        state = const AsyncLoading();
      }
      final todos = await _todoService.getTodos(userId: userId);
      state = AsyncData(todos);
      return todos;
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> refreshTodos({int? userId}) async {
    Log.d('TodosNotifier / refreshTodos / userId:$userId / $state');
    if (state is AsyncLoading) {
      return;
    }
    state = await AsyncValue.guard(
      () => _getTodos(userId: userId),
    );
  }
}

@riverpod
class FilterTodoTextNotifier extends _$FilterTodoTextNotifier {
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
  final filterTodoText = ref.watch(filterTodoTextNotifierProvider);
  final asyncTodos = ref.watch(todosNotifierProvider);
  return asyncTodos.when(
    error: (error, stackTrace) => asyncTodos,
    loading: () => asyncTodos,
    data: (todos) {
      final filteredTodos = todos
          .where(
            (todos) => todos.title.contains(filterTodoText),
          )
          .toList();
      return AsyncData(filteredTodos);
    },
  );
}
