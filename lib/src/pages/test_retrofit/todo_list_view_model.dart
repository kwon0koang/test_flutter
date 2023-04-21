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

// @Riverpod(keepAlive: true)
// class TodoDetailStateNotifier extends _$TodoDetailStateNotifier {
//   late TodoService todoService;

//   @override
//   FutureOr<TodoModel?> build({
//     required int userId,
//     required int id,
//   }) async {
//     try {
//       Log.d('kyk / build / userId:$userId / id:$id');
//       final AsyncValue<List<TodoModel>> retrofitResult =
//           ref.watch(todosStateNotifierProvider);

//       if (retrofitResult is AsyncLoading) {
//       } else if (retrofitResult is AsyncError) {
//       } else {
//         final todos = retrofitResult.value as List<TodoModel>;
//         return todos.firstWhere(
//           (todo) => todo.userId == userId && todo.id == id,
//         );
//       }
//     } on Exception catch (e) {
//       state = AsyncError(e, StackTrace.current);
//       throw Exception();
//     }
//   }
// }
