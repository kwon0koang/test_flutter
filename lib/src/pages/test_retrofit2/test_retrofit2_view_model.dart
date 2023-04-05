import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'test_retrofit2_view_model.g.dart';

@riverpod
class TestRetrofitStateNotifier extends _$TestRetrofitStateNotifier {
  late TodoService todoService = TodoService(ref);

  @override
  List<TodoModel> build() {
    return [];
  }

  Future<void> getTodos() async {
    final resp = await todoService.getTodos();
    state = resp;
  }
}
