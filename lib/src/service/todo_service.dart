import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/repository/todo_repository.dart';

class TodoService {
  final Ref _ref;

  late final TodoRepository _todoRepository;

  TodoService(this._ref) {
    _todoRepository = _ref.read(todoRepositoryProvider);
  }

  Future<List<TodoModel>> getTodos() async {
    // 테스트 1초 지연
    await Future.delayed(const Duration(seconds: 1));
    final todos = _todoRepository.getTodos();
    return todos;
  }
}
