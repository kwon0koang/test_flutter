import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModelStateNotifier extends _$TodoListViewModelStateNotifier {
  late TodoService todoService;

  @override
  void build() {}
}

@Riverpod(keepAlive: true)
class TodosStateNotifier extends _$TodosStateNotifier {
  late TodoService todoService;

  @override
  FutureOr<List<TodoModel>> build() async {
    todoService = TodoService(ref);
    return _initTodos();
  }

  Future<List<TodoModel>> _initTodos() async {
    try {
      state = const AsyncLoading();
      final todos = await todoService.getTodos();
      return todos;
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> getTodos() async {
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }
    state = await AsyncValue.guard(
      () => todoService.getTodos(),
    );
  }
}

@Riverpod(keepAlive: true)
class FilterTodoText extends _$FilterTodoText {
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
    final filterTodoText = ref.watch(filterTodoTextProvider);
    final asyncTodos = ref.watch(todosStateNotifierProvider);
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
