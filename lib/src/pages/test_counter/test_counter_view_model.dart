import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'test_counter_view_model.g.dart';

// @Riverpod(keepAlive: true)
@riverpod
TestCounterViewModel testCounterViewModel(TestCounterViewModelRef ref) =>
    TestCounterViewModel(ref);

class TestCounterViewModel {
  final Ref _ref;

  TestCounterViewModel(this._ref) {}

  int count = 0;

  void increment() {
    count++;
    Log.d(count);
  }

  void decrement() {
    count--;
    Log.d(count);
  }
}

@riverpod
class CountStateNotifier extends _$CountStateNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
    Log.d(state);
  }

  void decrement() {
    state--;
    Log.d(state);
  }
}
