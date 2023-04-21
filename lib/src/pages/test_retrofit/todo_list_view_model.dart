import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'todo_list_view_model.g.dart';

@Riverpod(keepAlive: true)
class TodosStateNotifier extends _$TodosStateNotifier {
  late TodoService todoService;

  @override
  FutureOr<List<TodoModel>> build() async {
    todoService = TodoService(ref);
    try {
      state = const AsyncLoading();
      final todos = await todoService.getTodos();
      return todos;
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      throw Exception();
    }
  }

  Future<void> getTodos() async {
    try {
      if (state is! AsyncData) {
        state = const AsyncLoading();
      }

      final todos = await todoService.getTodos();
      state = AsyncData(todos);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }
}
