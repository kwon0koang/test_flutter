import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/network/dio.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) => TodoRepository(ref);

@RestApi()
abstract class TodoRepository {
  factory TodoRepository(Ref ref) => _TodoRepository(
        ref.read(dioProvider),
      );

  @GET("/todos")
  Future<List<TodoModel>> getTodos({
    @Query("userId") int? userId,
  });
}
