import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/network/dio.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) => TodoRepository(ref);

// 마이데이터 api retrofit형식으로 정의
@RestApi()
abstract class TodoRepository {
  factory TodoRepository(Ref ref) => _TodoRepository(ref.read(dioProvider));

  @GET('/todos')
  // Future<List<TodoModel>> getTodos(@Queries() Map<String, dynamic> queries);
  Future<List<TodoModel>> getTodos();

  // @GET('get_time.cmd')
  // Future<ServerTimeResp> serverTime();

  // @GET('get_data.cmd')
  // Future getData(@Queries() Map<String, dynamic> queries);
}
