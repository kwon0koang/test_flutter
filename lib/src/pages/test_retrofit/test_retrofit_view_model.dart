import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_retrofit2/test_retrofit2_view_model.dart';
import 'package:test_flutter/src/service/todo_service.dart';

part 'test_retrofit_view_model.g.dart';

@riverpod
TestRetrofitViewModel testRetrofitViewModel(TestRetrofitViewModelRef ref) =>
    TestRetrofitViewModel(ref);

class TestRetrofitViewModel {
  final Ref _ref;

  late TodoService todoService = TodoService(_ref);

  TestRetrofitViewModel(this._ref) {}

  Future<List<TodoModel>> getTodos() {
    return todoService.getTodos();
  }
}
