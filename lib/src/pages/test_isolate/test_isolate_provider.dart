import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'test_isolate_provider.g.dart';

@riverpod
class CountForTestIsolate extends _$CountForTestIsolate {
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
