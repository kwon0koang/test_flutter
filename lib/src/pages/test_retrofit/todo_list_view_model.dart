import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModelNotifier extends _$TodoListViewModelNotifier {
  late TodoService todoService;

  @override
  void build() {}
}

@Riverpod(keepAlive: true)
class TodosNotifier extends _$TodosNotifier {
  late TodoService todoService;

  @override
  FutureOr<List<TodoModel>> build() async {
    todoService = TodoService(ref);
    return _initTodos();
  }

  Future<List<TodoModel>> _initTodos() async {
    try {
      if (state is! AsyncData) {
        state = const AsyncLoading();
      }
      final todos = await todoService.getTodos();
      return todos;
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> getTodos() async {
    state = await AsyncValue.guard(
      () => _initTodos(),
    );
  }
}

@Riverpod(keepAlive: true)
class FilterTodoTextNotifier extends _$FilterTodoTextNotifier {
  @override
  String build() {
    return '';
  }

  void updateFilterText(String filterText) {
    state = filterText;
  }

  void clearFilterText() {
    state = '';
  }
}

final filteredTodosProvider = Provider<AsyncValue<List<TodoModel>>>(
  (ref) {
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
  },
);
